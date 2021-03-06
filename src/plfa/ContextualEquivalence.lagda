---
title     : "Denotational equality implies contextual equivalence"
layout    : page
prev      : /Adequacy/
permalink : /ContextualEquivalence/
next      : /Acknowledgements/
---

\begin{code}
module plfa.ContextualEquivalence where
\end{code}

## Imports

\begin{code}
open import plfa.Untyped
  using (Context; _⊢_; ★; _∋_; ∅; _,_; Z; S_; `_; ƛ_; _·_; rename; subst;
         ext; exts; _[_]; subst-zero)
open import plfa.Substitution
   using (rename-subst; sub-id; sub-sub; ids)
open import plfa.LambdaReduction
  using (_—→_; ξ₁; ξ₂; β; ζ; _—↠_; _—→⟨_⟩_; _[]; appL-cong; —↠-trans)
open import plfa.Denotational
   using (ℰ; _≃_; ≃-sym; ≃-trans; _iff_)
open import plfa.Compositional   
   using (Ctx; plug; compositionality)
open import plfa.Soundness
   using (Subst; soundness)
open import plfa.Adequacy
   using (Clos; ClosEnv; ∅'; clos; _,'_; _⊢_⇓_; ⇓-var; ⇓-lam; ⇓-app; adequacy)

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; _≢_; refl; trans; sym; cong; cong₂; cong-app)
open Eq.≡-Reasoning using (begin_; _≡⟨⟩_; _≡⟨_⟩_; _∎)
open import Data.Product using (_×_; Σ; Σ-syntax; ∃; ∃-syntax; proj₁; proj₂)
  renaming (_,_ to ⟨_,_⟩)
open import Data.Sum
open import Data.Nat
open import Relation.Nullary using (¬_)
open import Relation.Nullary.Negation using (contradiction)
open import Data.Empty using (⊥-elim) renaming (⊥ to Bot)
open import Data.Unit
open import Relation.Nullary using (Dec; yes; no)
open import Function using (_∘_)
\end{code}

## A logical relation between call-by-name closures and terms

\begin{code}
𝔹 : Clos → (∅ ⊢ ★) → Set
ℍ : ∀{Γ} → ClosEnv Γ → Subst Γ ∅ → Set

𝔹 (clos {Γ} M γ) N = Σ[ σ ∈ Subst Γ ∅ ] ℍ γ σ × (N ≡ subst σ M)

ℍ γ σ = ∀{x} → 𝔹 (γ x) (σ x)

ext-subst : ∀{Γ Δ} → Subst Γ Δ → Δ ⊢ ★ → Subst (Γ , ★) Δ
ext-subst{Γ}{Δ} σ N {A} = (subst (subst-zero N)) ∘ (exts σ)

ℍ-ext : ∀ {Γ} {γ : ClosEnv Γ} {σ : Subst Γ ∅} {c} {N : ∅ ⊢ ★}
      → ℍ γ σ  →  𝔹 c N
        --------------------------------
      → ℍ (γ ,' c) ((subst (subst-zero N)) ∘ (exts σ))
ℍ-ext {Γ} {γ} {σ} g e {Z} = e
ℍ-ext {Γ} {γ} {σ}{c}{N} g e {S x} = G g
  where
      eq : ext-subst σ N (S x) ≡ σ x
      eq =
        begin
          (subst (subst-zero N)) (exts σ (S x))
        ≡⟨⟩
          ((subst (subst-zero N)) ∘ (rename S_)) (σ x)
        ≡⟨ rename-subst{M = σ x} ⟩
          (subst ((subst-zero N) ∘ S_)) (σ x)        
        ≡⟨ sub-id ⟩
          σ x
        ∎
      G : 𝔹 (γ x) (σ x) → 𝔹 (γ x) (ext-subst σ N (S x))
      G b rewrite eq = b
\end{code}

## Soundness of call-by-name wrt. beta reduction

\begin{code}
cbn-soundness : ∀{Γ}{γ : ClosEnv Γ}{σ : Subst Γ ∅}{M : Γ ⊢ ★}{c : Clos}
              → γ ⊢ M ⇓ c → ℍ γ σ
              → Σ[ N ∈ ∅ ⊢ ★ ] (subst σ M —↠ N) × 𝔹 c N
cbn-soundness {γ = γ} (⇓-var{x = x} eq d) h
    with γ x | h {x} | eq
... | clos M' γ' | ⟨ σ' , ⟨ h' , r ⟩ ⟩ | refl
    with cbn-soundness{σ = σ'} d h'
... | ⟨ N , ⟨ r' , bn ⟩ ⟩ rewrite r =    
      ⟨ N , ⟨ r' , bn ⟩ ⟩
cbn-soundness {Γ} {γ} {σ} {.(ƛ _)} {.(clos (ƛ _) γ)} (⇓-lam{M = N}) h =
   ⟨ subst σ (ƛ N) , ⟨ subst σ (ƛ N) [] , ⟨ σ , ⟨ h , refl ⟩ ⟩ ⟩ ⟩
cbn-soundness {Γ} {γ} {σ} {.(_ · _)} {c}
    (⇓-app{L = L}{M = M}{Δ = Δ}{δ = δ}{N = N} d₁ d₂) h
    with cbn-soundness{σ = σ} d₁ h
... | ⟨ L' , ⟨ σL—↠L' , ⟨ σ₁ , ⟨ Hδσ₁ , eq ⟩ ⟩ ⟩ ⟩ rewrite eq
    with cbn-soundness{σ = ext-subst σ₁ (subst σ M)} d₂
           (λ {x} → ℍ-ext{Δ}{σ = σ₁} Hδσ₁ (⟨ σ , ⟨ h , refl ⟩ ⟩){x})
       | β{∅}{subst (exts σ₁) N}{subst σ M}
... | ⟨ N' , ⟨ r' , bl ⟩ ⟩ | r 
    rewrite sub-sub{M = N}{σ₁ = exts σ₁}{σ₂ = subst-zero (subst σ M)} =
    let rs = (ƛ subst (exts σ₁) N) · subst σ M —→⟨ r ⟩ r' in
    ⟨ N' , ⟨ —↠-trans (appL-cong σL—↠L') rs , bl ⟩ ⟩
\end{code}


## Denotational equivalence implies contextual equivalence

\begin{code}
terminates : ∀{Γ} → (M : Γ ⊢ ★) → Set
terminates {Γ} M = Σ[ N ∈ (Γ , ★ ⊢ ★) ] (M —↠ ƛ N)
\end{code}

\begin{code}
_≅_ : ∀{Γ} → (M N : Γ ⊢ ★) → Set
(_≅_ {Γ} M N) = ∀ {C : Ctx Γ ∅}
                → (terminates (plug C M)) iff (terminates (plug C N))
\end{code}

\begin{code}
denot-equal-terminates : ∀{Γ} {M N : Γ ⊢ ★} {C : Ctx Γ ∅}
  → ℰ M ≃ ℰ N
  → terminates (plug C M)
  → terminates (plug C N)
denot-equal-terminates {Γ}{M}{N}{C} eq ⟨ N' , CM—↠CƛN' ⟩ =
  let ℰCM≃ℰCƛN' = soundness CM—↠CƛN' in
  let ℰCM≃ℰCN = compositionality{Γ = Γ}{Δ = ∅}{C = C} eq in
  let ℰCN≃ℰCƛN' = ≃-trans (≃-sym ℰCM≃ℰCN) ℰCM≃ℰCƛN' in
    G (adequacy ℰCN≃ℰCƛN')
  where
  H-id : ℍ ∅' ids
  H-id {()}

  G : (Σ[ Δ ∈ Context ] Σ[ M' ∈ (Δ , ★ ⊢ ★) ] Σ[ γ ∈ ClosEnv Δ ]
         ∅' ⊢ (plug C N) ⇓ clos (ƛ M') γ)
    → terminates (plug C N)
  G ⟨ Δ , ⟨ M' , ⟨ γ , CN⇓ƛM'γ ⟩ ⟩ ⟩
      with cbn-soundness{σ = ids} CN⇓ƛM'γ H-id
  ... | ⟨ N'' , ⟨ rs , ⟨ σ , ⟨ h , eq2 ⟩ ⟩ ⟩ ⟩
      rewrite sub-id{M = plug C N} | eq2 =
      ⟨ subst (λ {A} → exts σ) M' , rs ⟩
\end{code}

\begin{code}
denot-equal-contex-equal : ∀{Γ} {M N : Γ ⊢ ★}
  → ℰ M ≃ ℰ N
  → M ≅ N
denot-equal-contex-equal{Γ}{M}{N} eq {C} =
   ⟨ (λ tm → denot-equal-terminates eq tm) ,
     (λ tn → denot-equal-terminates (≃-sym eq) tn) ⟩
\end{code}

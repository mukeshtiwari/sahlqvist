Require Import Coq.Arith.PeanoNat.
Require Import EqNat.
Require Import Arith.

Lemma beq_nat_comm : forall (n m : nat),
  beq_nat n m = beq_nat m n.
Proof.
  intros.
  case_eq (beq_nat n m); intros Hbeq.
    rewrite (beq_nat_true n m Hbeq).
    apply beq_nat_refl.

    case_eq (beq_nat m n); intros Hbeq2.
      rewrite (beq_nat_true m n Hbeq2) in Hbeq.
      rewrite <- beq_nat_refl in Hbeq.
      discriminate.

      reflexivity.
Qed.

Lemma bi_contrapos : forall A B: Prop, (A <-> B) -> (~A <-> ~B).
Proof.
  intros A B; intros A_B.
  unfold iff; apply conj.
    intros not_A; intros pf_B.
    apply not_A.
    apply A_B; exact pf_B.

    intros not_B; intros pf_A.
    apply not_B.
    apply A_B; exact pf_A.
Qed. 

Lemma bi_conj : forall A B C D: Prop, ((A <-> C) /\ (B <-> D)) -> ((A /\ B) <-> (C /\ D)).
Proof.
  intros A B C D.
  intros H.
  destruct H as [A_C B_D].
  unfold iff; apply conj.
    intros AandB.
    destruct AandB as [pf_A pf_B].
    apply conj.
      apply A_C; exact pf_A.

      apply B_D; exact pf_B.
    intros CandD.
    destruct CandD as [pf_C pf_D].
    apply conj.
      apply A_C; exact pf_C.

      apply B_D; exact pf_D.
Qed.

Lemma True_conj : forall (A B : Prop), (A <-> (True /\ B)) <-> (A <-> B).
Proof.
  intros.
  split.
    intros.
    split.
      intros.
      destruct H as [H1 H2].
      pose proof (H1 H0).
      apply H.

      intros.
      apply H.
      apply conj.
        exact I.

        exact H0.

    intros.
    split.
      intros.
      apply conj.
        exact I.

        apply H; exact H0.

      intros.
      apply H; apply H0.
Qed.


(* ------------ *)

Lemma arith_minus_exp : forall (i n m : nat),
  n - (m + i) = n - m - i.
Proof.
  induction i.
    intros.
    rewrite <- plus_n_O.
    rewrite Nat.sub_0_r.
    reflexivity.

    intros n m.
    rewrite <- plus_n_Sm.
    rewrite Nat.add_comm.
    rewrite plus_n_Sm.
    rewrite Nat.add_comm.
    rewrite IHi.
(* Search S plus.
    rewrite one_suc. 
Search plus "comm".
    rewrite arith_plus_comm with (a := i). *)
    rewrite <- Nat.sub_add_distr.
    rewrite plus_Sn_m. rewrite plus_n_Sm.
    rewrite Nat.sub_add_distr. reflexivity.
Qed.

Lemma leb_plus_r : forall (i n m : nat),
  Nat.leb i n = true -> Nat.leb i (n + m) = true.
Proof.
  intros i' n' m.
  generalize n' i'.
  induction m; intros n i H.
    rewrite plus_0_r.
    exact H.

    specialize (IHm (n + 1) i).
    rewrite <- Nat.add_1_r.
    rewrite Nat.add_comm with (n := m).
    rewrite <- plus_assoc_reverse.
    apply IHm.
    rewrite Nat.add_1_r.
    apply leb_correct. apply le_S.
    apply leb_complete. assumption.
Qed.

Lemma leb_minus_pre : forall (n m : nat),
  Nat.leb n m = true -> Nat.leb (n-1) (m-1) = true.
Proof.
  intros n m Hleb.
  induction n.
    induction m.
      simpl; reflexivity.

      simpl in *; reflexivity.

    induction m.
      simpl in *; discriminate.

      simpl in *. 
      do 2 rewrite Nat.sub_0_r.
      assumption.
Qed.

Lemma leb_minus : forall (i n m : nat),
  Nat.leb n m = true -> Nat.leb (n-i) (m-i) = true.
Proof.
  induction i.
    intros.
    do 2 rewrite Nat.sub_0_r; assumption.

    intros n m Hleb.
    rewrite <- Nat.add_1_r.
    rewrite Nat.add_comm.
    do 2 rewrite arith_minus_exp.
    apply IHi.
    apply leb_minus_pre.
    assumption.
Qed.

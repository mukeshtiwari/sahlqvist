%.vo : %.v
	coqc $*.v

Modal.vo : Modal.v

my_bool.vo : Modal.vo my_bool.v

My_Prop.vo : my_bool.vo My_Prop.v

SecOrder.vo : My_Prop.vo SecOrder.v 

p_occurs_in.vo : SecOrder.vo p_occurs_in.v 

#P_occurs_in_alpha.v 
# my_arith.v 
# my_arith__my_leb_nat.v 
# at_pv.v 
# at_pred.v 
# ST_setup.v 
# occ_in_phi.v 
# is_pos_neg.v 
# is_pos_neg_lemmas.v 
# p_is_pos.v 
## Correctness_ST_world_model.v
# List_machinery_impl.v 
# Correctness_ST.v 
# My_List_Map.v 
# Unary_Predless.v 
# Occ_In_Alpha.v 
# nList_egs.v 
# Uniform_Defns.v 
# pos_SO2.v 
# Rep_Pred_FOv.v 
# Indicies.v 
# Unary_Predless_l.v 
# Num_Occ.v 
# Identify.v 
# P_occ_rep_pred.v 
# Is_Pos_Rep_Pred.v 
# neg_SO2.v 
# Monotonicity_SO.v 
# Pre_Sahlqvist_Uniform_Pos.v 
# Num_Occ_l2.v
# Sahlqvist_Uniform_Pos.v 
# vsSahlq_preprocessing1.v 
# vsSahlq_preprocessing2.v 
## vsSahlq_preprocessing3.v 
#vsSahlq_instant3.v 
#vsSahlq_instant_pre_to_be_sorted.v 
# vsSahlq_instant9.v 
# vsSahlq_instant10.v 
# vsSahlq_instant13.v 
# vsSahlq_instant15.v 
# vsSahlq_instant16.v 
# vsSahlq_instant17.v 
# vsSahlq_instant19.v 
# vsSahlq_instant20.v
# vsSahlq_extraction.v 
clean : 
	rm -rf  *.vo *.glob



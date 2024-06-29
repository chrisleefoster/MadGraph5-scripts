import model var_model
generate var_initial_state > var_final_state var_qcd_qed
output var_output_file
launch
order=var_order
fixed_order=ON
set MT 1.725000e+02
set pdlabel lhapdf
set lhaid 27400
set fixed_ren_scale True
set fixed_fac_scale True
set mur_ref_fixed 213.9
set muf_ref_fixed 213.9
set ebeam1 3500
set ebeam2 3500
set reweight_pdf True
set req_acc_fo 0.001
exit

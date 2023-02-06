# model for irradiated RPV steel in:
# Ghiath Monnet, Ludovic Vincent, Lionel Gelebart
# Multiscale modeling of crystal plasticity in Reactor Pressure Vessel steels: Prediction of irradiation hardening
# Journal of Nuclear Materials 514 (2019) 128-138
# polycrystal with slip gradients term in hardening
# coupled with phase field fracture

[GlobalParams]
  displacements = 'ux uy uz'
[]

# 2x2x2 cube polycrystal
[Mesh]
  type = GeneratedMesh
  dim = 3
  nx = 2
  ny = 2
  nz = 2
  xmax = 2.0
  ymax = 2.0
  zmax = 2.0
  elem_type = HEX8
[]

[AuxVariables]
  # slip rate
  # of each slip system
  # so units are 1/time
  [./slip_rate_1]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_2]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_3]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_4]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_5]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_6]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_7]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_8]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_9]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_10]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_11]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_12]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_13]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_14]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_15]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_16]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_17]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_18]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_19]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_20]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_21]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_22]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_23]
   order = FIRST
   family = MONOMIAL
  [../]
  [./slip_rate_24]
   order = FIRST
   family = MONOMIAL
  [../]  
  
  # build slip rate vector
  [./slip_rate_vector]
    order = FIRST
    family = MONOMIAL
    components = 24
  [../]
  
  # derivatives of the slip rate
  # with respect to the edge and screw
  # direction of motion
  [./dslip_increment_dedge]
    order = CONSTANT
    family = MONOMIAL
    components = 24
  [../]
  [./dslip_increment_dscrew]
    order = CONSTANT
    family = MONOMIAL
    components = 24
  [../]
  
  # set bound variable to impose
  # that damage can only grow
  [./bounds_dummy]
  [../]
[]

[Modules/TensorMechanics/Master/all]
  strain = FINITE
  add_variables = true
  generate_output = 'stress_xx stress_yy stress_zz stress_xy stress_xz stress_yz strain_xx strain_yy strain_zz strain_xy strain_xz strain_yz'
[]

[Modules/PhaseField/Nonconserved/c]
  free_energy = F
  kappa = kappa_op
  mobility = L
[]

# off diagonal Jacobian kernels
[Kernels]

  [./solid_x]
    type = PhaseFieldFractureMechanicsOffDiag
    variable = ux
    component = 0
    c = c
    use_displaced_mesh = true
  [../]
  [./solid_y]
    type = PhaseFieldFractureMechanicsOffDiag
    variable = uy
    component = 1
    c = c
    use_displaced_mesh = true
  [../]
  [./solid_z]
    type = PhaseFieldFractureMechanicsOffDiag
    variable = uz
    component = 2
    c = c
    use_displaced_mesh = true
  [../]
  
  [./off_disp]
    type = AllenCahnElasticEnergyOffDiag
    variable = c
    displacements = 'ux uy uz'
    mob_name = L
    use_displaced_mesh = true
  [../]
[]

[AuxKernels]
  # slip rate
  # of each slip system
  # so units are 1/time
  # the corresponding material property in the material class
  # is called slip_increment but it corresponds to the rate
  [./slip_rate_1]
   type = MaterialStdVectorAux
   variable = slip_rate_1
   property = slip_increment
   index = 0
   execute_on = timestep_end
  [../]
  [./slip_rate_2]
   type = MaterialStdVectorAux
   variable = slip_rate_2
   property = slip_increment
   index = 1
   execute_on = timestep_end
  [../]
  [./slip_rate_3]
   type = MaterialStdVectorAux
   variable = slip_rate_3   
   property = slip_increment
   index = 2
   execute_on = timestep_end
  [../]
  [./slip_rate_4]
   type = MaterialStdVectorAux
   variable = slip_rate_4
   property = slip_increment
   index = 3
   execute_on = timestep_end
  [../]
  [./slip_rate_5]
   type = MaterialStdVectorAux
   variable = slip_rate_5
   property = slip_increment
   index = 4
   execute_on = timestep_end
  [../]
  [./slip_rate_6]
   type = MaterialStdVectorAux
   variable = slip_rate_6
   property = slip_increment
   index = 5
   execute_on = timestep_end
  [../]
  [./slip_rate_7]
   type = MaterialStdVectorAux
   variable = slip_rate_7   
   property = slip_increment
   index = 6
   execute_on = timestep_end
  [../]
  [./slip_rate_8]
   type = MaterialStdVectorAux
   variable = slip_rate_8
   property = slip_increment
   index = 7
   execute_on = timestep_end
  [../]
  [./slip_rate_9]
   type = MaterialStdVectorAux
   variable = slip_rate_9
   property = slip_increment
   index = 8
   execute_on = timestep_end
  [../]
  [./slip_rate_10]
   type = MaterialStdVectorAux
   variable = slip_rate_10
   property = slip_increment
   index = 9
   execute_on = timestep_end
  [../]
  [./slip_rate_11]
   type = MaterialStdVectorAux
   variable = slip_rate_11   
   property = slip_increment
   index = 10
   execute_on = timestep_end
  [../]
  [./slip_rate_12]
   type = MaterialStdVectorAux
   variable = slip_rate_12
   property = slip_increment
   index = 11
   execute_on = timestep_end
  [../]
  [./slip_rate_13]
   type = MaterialStdVectorAux
   variable = slip_rate_13
   property = slip_increment
   index = 12
   execute_on = timestep_end
  [../]
  [./slip_rate_14]
   type = MaterialStdVectorAux
   variable = slip_rate_14
   property = slip_increment
   index = 13
   execute_on = timestep_end
  [../]
  [./slip_rate_15]
   type = MaterialStdVectorAux
   variable = slip_rate_15   
   property = slip_increment
   index = 14
   execute_on = timestep_end
  [../]
  [./slip_rate_16]
   type = MaterialStdVectorAux
   variable = slip_rate_16
   property = slip_increment
   index = 15
   execute_on = timestep_end
  [../]
  [./slip_rate_17]
   type = MaterialStdVectorAux
   variable = slip_rate_17
   property = slip_increment
   index = 16
   execute_on = timestep_end
  [../]
  [./slip_rate_18]
   type = MaterialStdVectorAux
   variable = slip_rate_18
   property = slip_increment
   index = 17
   execute_on = timestep_end
  [../]
  [./slip_rate_19]
   type = MaterialStdVectorAux
   variable = slip_rate_19   
   property = slip_increment
   index = 18
   execute_on = timestep_end
  [../]
  [./slip_rate_20]
   type = MaterialStdVectorAux
   variable = slip_rate_20
   property = slip_increment
   index = 19
   execute_on = timestep_end
  [../]
  [./slip_rate_21]
   type = MaterialStdVectorAux
   variable = slip_rate_21
   property = slip_increment
   index = 20
   execute_on = timestep_end
  [../]
  [./slip_rate_22]
   type = MaterialStdVectorAux
   variable = slip_rate_22
   property = slip_increment
   index = 21
   execute_on = timestep_end
  [../]
  [./slip_rate_23]
   type = MaterialStdVectorAux
   variable = slip_rate_23   
   property = slip_increment
   index = 22
   execute_on = timestep_end
  [../]
  [./slip_rate_24]
   type = MaterialStdVectorAux
   variable = slip_rate_24
   property = slip_increment
   index = 23
   execute_on = timestep_end
  [../]
  
  # build slip rate vector
  [./slip_rate_vector]
    type = BuildArrayVariableAux
    variable = slip_rate_vector
    component_variables = 'slip_rate_1 slip_rate_2 slip_rate_3 slip_rate_4 slip_rate_5 slip_rate_6 slip_rate_7 slip_rate_8 slip_rate_9 slip_rate_10 slip_rate_11 slip_rate_12 slip_rate_13 slip_rate_14 slip_rate_15 slip_rate_16 slip_rate_17 slip_rate_18 slip_rate_19 slip_rate_20 slip_rate_21 slip_rate_22 slip_rate_23 slip_rate_24'
  [../]
  
  [./edge_directional_derivative]
    type = ArrayDirectionalDerivative
    variable = dslip_increment_dedge
    gradient_variable = slip_rate_vector
    dislo_character = edge
  	execute_on = timestep_end
  [../]
  [./screw_directional_derivative]
    type = ArrayDirectionalDerivative
    variable = dslip_increment_dscrew
    gradient_variable = slip_rate_vector
    dislo_character = screw
  	execute_on = timestep_end
  [../]  
[]

# bounds used to impose that damage can only grow
[Bounds]
  [./irreversibility]
    type = VariableOldValueBoundsAux
    variable = bounds_dummy
    bounded_variable = c
    bound_type = lower
  [../]
  [./upper]
    type = ConstantBoundsAux
    variable = bounds_dummy
    bounded_variable = c
    bound_type = upper
    bound_value = 1.0
  [../]
[]

[BCs]
  [./symmy]
    type = DirichletBC
    variable = uy
    boundary = bottom
    value = 0
  [../]
  [./symmx]
    type = DirichletBC
    variable = ux
    boundary = left
    value = 0
  [../]
  [./symmz]
    type = DirichletBC
    variable = uz
    boundary = back
    value = 0
  [../]
  [./tdisp]
    type = FunctionDirichletBC
    variable = uz
    boundary = front
    function = '0.001*t'
  [../]
[]

[UserObjects]
  
  # poly_euler_angles.txt is a file with a list of Euler angles
  # on the structured mesh
  # row index: first growth along x, then y, then z
  # angles in degrees 
  [./prop_read]
    type = PropertyReadFile
    prop_file_name = 'poly_euler_angles.txt'
    nprop = 3
    read_type = element
  [../]
  
[]

[Materials]

  # Elastic constants from Table 2 in:
  # Sudook A.Kim, Ward L.Johnson
  # Elastic constants and internal friction of martensitic steel, ferritic-pearlitic steel, and α-iron
  # Materials Science and Engineering: A
  # Volumes 452–453, 15 April 2007, Pages 633-639
  # https://www.sciencedirect.com/science/article/pii/S0921509306026244
  [./elasticity_tensor]
    type = ComputeElasticityTensorCP
    C_ijkl = '2.3e5 1.35e5 1.35e5 2.3e5 1.35e5 2.3e5 1.17e5 1.17e5 1.17e5'
    fill_method = symmetric9
    read_prop_user_object = prop_read
  [../]
  
  # coupled crystal plasticity and damage material
  # plastic_damage_prefactor from 0 to 1
  # set the fraction of plastic work that contributes to damage
  [./stress]
    type = ComputeCrystalPlasticityStressDamage
    crystal_plasticity_models = 'irradiatedRPVsteel'
    tan_mod_type = exact
    maximum_substep_iteration = 5
	rtol = 1e-4
	abs_tol = 1e-4
	c = c
    E_name = 'elastic_energy'
    D_name = 'degradation'
    use_current_history_variable = true
    plastic_damage_prefactor = 0.0
  [../]
  
  # Parameters are like in the original article
  # but d_grain = 50.0 is recalibrated to match the 464 MPa
  # L. Vincent, M. Libert, B. Marini, C. Reyb  
  # Towards a modelling of RPV steel brittle fracture using crystal plasticity
  # computations on polycrystalline aggregates
  # Journal of Nuclear Materials, Volume 406, Issue 1, 1 November 2010, Pages 91-96
  
  [./irradiatedRPVsteel]
    type = CrystalPlasticityIrradiatedRPVSteel
    number_slip_systems = 24
    slip_sys_file_name = 'input_slip_sys_bcc24.txt'
    resistance_tol = 0.1
	slip_increment_tolerance = 0.1
	burgers_vector_mag = 0.000256
	shear_modulus = 86000.0
	RT_shear_modulus = 86000.0
	a_self = 0.1
	a_col = 0.7
	K_Hall_Petch = 480.0
	d_grain = 50.0 #6.9 micron
	rho_carbide = 0.0608
	a_carbide = 0.0
	C_DL_diameter = 0.0256
	a_DL = 0.25
	C_SC_diameter = 0.0256
	a_SC = 0.04
	rho_ref = 1.0
	ao = 0.000001
	xm = 0.01
	attack_frequency = 2.0e11
	minimum_screw_length = 0.010
	Gibbs_free_energy_slip = 0.84
	k = 8.6e-5
	const_slip_resistance_110 = 360.0
	const_slip_resistance_112_TW = 410.0
	const_slip_resistance_112_AT = 480.0
	K_self = 17.0
	K_forest = 5.666
	y_drag = 0.002
	lambda_DL = 1.0
	lambda_SC = 1.0
	init_rho_ssd = 10.0
	init_rho_gnd_edge = 0.0
	init_rho_gnd_screw = 0.0
	
	# To match the yield strength of 540 MPa of the irradiated Euromaterial A, 
	# assuming the same initial density of solute clusters and dislocation loops,
	# the following are the resulting initial densities of dislocation loops due to irradiation
	# and solute clusters due to irradiation
	
	init_C_DL = 2600.0 # 1/micron^3
	init_C_SC = 2600.0 # 1/micron^3
	
	rho_tol = 1.0
	dslip_increment_dedge = dslip_increment_dedge
	dslip_increment_dscrew = dslip_increment_dscrew
  [../]
  
  # degradation function for the positive part of the strain energy
  [./degradation]
    type = DerivativeParsedMaterial
    f_name = degradation
    args = 'c'
    function = '(1.0-c)^2*(1.0 - eta) + eta'
    constant_names       = 'eta'
    constant_expressions = '1.0e-3'
    derivative_order = 2
  [../]
  
  # gc_prop is the fracture energy
  # if plastic work is included
  # fracture takes place at lower strain
  # l is the characteristic crack diffusion length
  # ideally element size should be about one fourth of l
  [./pfbulkmat]
    type = GenericConstantMaterial
    prop_names = 'gc_prop l visco'
    prop_values = '15.0 1.0 1e-3'
  [../]
  
  [./define_mobility]
    type = ParsedMaterial
    material_property_names = 'gc_prop visco'
    f_name = L
    function = '1.0/(gc_prop * visco)'
  [../]
  [./define_kappa]
    type = ParsedMaterial
    material_property_names = 'gc_prop l'
    f_name = kappa_op
    function = 'gc_prop * l'
  [../]
  [./local_fracture_energy]
    type = DerivativeParsedMaterial
    f_name = local_fracture_energy
    args = 'c'
    material_property_names = 'gc_prop l'
    function = 'c^2 * gc_prop / 2 / l'
    derivative_order = 2
  [../]
  [./fracture_driving_energy]
    type = DerivativeSumMaterial
    args = c
    sum_materials = 'elastic_energy local_fracture_energy'
    derivative_order = 2
    f_name = F
  [../]
[]

[Preconditioning]
  [./smp]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient
  solve_type = 'PJFNK'

  petsc_options_iname = '-pc_type  -snes_type'
  petsc_options_value = 'lu vinewtonrsls'
  
  nl_abs_tol = 1e-6
  nl_rel_step_tol = 1e-6
  dtmax = 1.0
  nl_rel_tol = 1e-6
  dtmin = 0.000001
  dt = 0.2
  end_time = 0.2 # end_time = 20.0 to reach 1% strain
  nl_abs_step_tol = 1e-6
[]

[Outputs]
  exodus = true
  interval = 1 # 5
[]

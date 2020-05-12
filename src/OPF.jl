# module OPF
using JuMP, JuMPUtil, Ipopt, MathProgBase
using SparseArrays, LinearAlgebra, NLsolve, ForwardDiff
using MatrixNetworks, StructArrays, Distributed ## for setting n-1 limits
using MPCCases
using Printf
using Pkg
## based on: https://github.com/StructJuMP/StructJuMP.jl/tree/master/examples/PowerGrid

mutable struct OPFModel
    m::JuMP.Model
    status::Symbol
    kind::Symbol
    other::Dict
end
export OPFModel

include("default.jl")
export DefaultOptions

include("constraints.jl")
export add_p_constraint!, add_q_constraint!
export add_line_current_constraint!, add_line_power_constraint!

include("acpf_model.jl")
export acpf_model

include("acopf_model.jl")
export acopf_model

include("s_acopf_model.jl")
export s_acopf_model

include("acopf_zip_model.jl")
export acopf_zip_model

include("scacopf_model.jl")
export scacopf_model, get_operating_points

include("n1_limits.jl")
export get_n1_limits

include("util.jl")
export acopf_solve, acopf_initialPt_IPOPT
export acopf_outputAll, get_values
export RGL_id, RGL_idx, model_idx
export PQnet
export get_opfmodeldata

include("pfe.jl")
export P_i, Q_i
export PF, PFE, PFE!, PFE_J!
export PF_vec, PFE_vec, PFE_vec!

include("jacobian.jl")
export jac_z_num
export jac_z_alg_ew
export dStilde_dVtilde, jac_z_alg_vec
export jac_z

include("sensitivities.jl")
export get_Gamma, get_Gamma_fd, get_Gamma_ew

include("exitrates.jl")
export acopf_solve_exitrates, compute_exitrate_kkt, write_optimal_values

# include("acopf_n1_limits.jl")
# export set_n1_limits!
# export get_nonislanding_lines
# export adjust_feas_ratings!, check_feasibility
# export adjust_solv_ratings!, check_solvability
# export remove_line!
# export reinstate_line!
# export get_opf_point
# export get_flowmag2s
# export get_ratings

# end # module
module GraphsMatching

using Graphs

using SparseArrays: spzeros

using JuMP
using MathOptInterface
const MOI = MathOptInterface
import BlossomV # 'using BlossomV'  leads to naming conflicts with JuMP
using Hungarian

export MatchingResult, maximum_weight_matching, maximum_weight_matching_reduction, maximum_weight_maximal_matching, minimum_weight_perfect_matching, HungarianAlgorithm, LPAlgorithm

export solve, AuxGraph, Tree, Matching;
"""
    struct MatchingResult{U}
        weight::U
        mate::Vector{Int}
    end

A type representing the result of a matching algorithm.

    weight: total weight of the matching

    mate:    `mate[i] = j` if vertex `i` is matched to vertex `j`.
             `mate[i] = -1` for unmatched vertices.
"""
struct MatchingResult{U<:Real}
    weight::U
    mate::Vector{Int}
end

include("lp.jl")
include("maximum_weight_matching.jl")
include("blossomv.jl")
include("hungarian.jl")
include("maximum_weight_maximal_matching.jl")

end # module

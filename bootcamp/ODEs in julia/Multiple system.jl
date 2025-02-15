using DifferentialEquations

# u = [x, y, x]
# u[1] = x
# u[2] = y
# u[3] = z
function lorenz!(du, u, p, t)
    du[1] = 10.0 * (u[2] - u[1])
    du[2] = u[1] * (28.0 - u[3]) - u[2]
    du[3] = u[1]*u[2] - (8/3) * u[3]
end

u0 = [1.0, 0.0, 0.0]
tspan = (0.0, 100.0)

prob = ODEProblem(lorenz!, u0, tspan)

sol = solve(prob)

using Plots
plot(sol, idxs = (1, 2, 3))

using Polynomial

type TransferFunction
    num::Array{Poly}
    den::Array{Poly}
    variable::String
    io_delay::Real
    input_delay::Real
    output_delay::Real
    ts::Real
    time_unit::String
    input_name::String
    input_unit::String
    input_group::InputGroup
    output_name::String
    output_unit::String
    output_group::OutputGroup
    name::String
    notes::String
    user_data::Any

    TransferFunction(num, den; variable="s", io_delay=0, input_delay=0, output_delay=0, ts=0,
        time_unit="seconds", input_name="", input_unit="", input_group=InputGroup(), output_name="",
        output_unit="", output_group=OutputGroup(), name="", notes="", user_data=[]) = new(num, den, variable,
        io_delay, input_delay, output_delay, ts, time_unit, input_name, input_unit, input_group, output_name,
        output_unit, output_group, name, notes, user_data)
end

TF(num::Array{Poly}, den::Array{Poly}) = TransferFunction(num, den)
TF(num::Poly, den::Poly) = TransferFunction([num], [den])
TF(num::Array{Int}, den::Array{Int}) = tf(Poly(num), Poly(den))
TF(num, den; args...) = TransferFunction(num, den, args...)

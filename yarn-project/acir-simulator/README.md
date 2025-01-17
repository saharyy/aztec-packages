# ACIR Simulator

## Responsibilities

This library package is responsible for simulating function circuits compiled to ACIR.

Simulating a function implies generating the partial witness and the public inputs of the function, as well as collecting all the data (such as created notes or nullifiers, or state changes) that are necessary for components upstream.

It's able to simulate three different types of functions:

### Private Functions

Private functions are simulated and proved clientside, and verified clientside in the private kernel circuit.

The public inputs of private functions is defined [here](../circuits.js/src/structs/private_circuit_public_inputs.ts).

They are run with the assistance of a DB oracle that provides any private data requested by the function.

Private functions can call another private function, and can request to call a public function, but the public function execution will be performed by the sequencer asynchronously, thus having no access to the return values.

### Public Functions

Public functions are simulated and proved on the sequencer side, and verified by the public kernel circuit.

The public inputs of public functions is defined [here](../circuits.js/src/structs/public_circuit_public_inputs.ts).

They are run with the assistance of an oracle that provides any value read from the public state tree.

Public functions can call other public function, but no private functions.

### Unconstrained (view) Functions

Unconstrained functions are used to extract useful data for users, such as the user balance. They are not proved, and are simulated clientside.

They are run with the assistance of a DB oracle that provides any private data requested by the function.

At the moment, unconstrained functions cannot call any other function. It would be possible to allow them to call other unconstrained functions.

## Usage

### Development

Same steps as any other library. They are detailed [here](../README.md#development)

### Testing

Same steps as any other library. They are detailed [here](../README.md#tests)

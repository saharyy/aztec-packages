import { pedersenHash, pedersenHashInputs } from '@aztec/circuits.js/barretenberg';
import { IWasmModule } from '@aztec/foundation/wasm';
import { Hasher } from '@aztec/types';

/**
 * A helper class encapsulating Pedersen hash functionality.
 * @deprecated Don't call pedersen directly in production code. Instead, create suitably-named functions for specific
 * purposes.
 */
export class Pedersen implements Hasher {
  constructor(private wasm: IWasmModule) {}

  /*
   * @deprecated Don't call pedersen directly in production code. Instead, create suitably-named functions for specific
   * purposes.
   */
  public hash(lhs: Uint8Array, rhs: Uint8Array): Buffer {
    return pedersenHash(this.wasm, lhs, rhs);
  }

  /*
   * @deprecated Don't call pedersen directly in production code. Instead, create suitably-named functions for specific
   * purposes.
   */
  public hashInputs(inputs: Buffer[]): Buffer {
    return pedersenHashInputs(this.wasm, inputs);
  }
}

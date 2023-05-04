import { Fr } from '@aztec/foundation/fields';
import { serializeToBuffer } from '../../utils/serialize.js';
import { TxContext } from '../tx_context.js';
import { BufferReader } from '@aztec/foundation/serialize';

export class PrivateHistoricTreeRoots {
  constructor(
    public privateDataTreeRoot: Fr,
    public nullifierTreeRoot: Fr,
    public contractTreeRoot: Fr,
    public privateKernelVkTreeRoot: Fr, // future enhancement
  ) {}

  toBuffer() {
    return serializeToBuffer(
      this.privateDataTreeRoot,
      this.nullifierTreeRoot,
      this.contractTreeRoot,
      this.privateKernelVkTreeRoot,
    );
  }

  isEmpty() {
    return (
      this.privateDataTreeRoot.isZero() &&
      this.nullifierTreeRoot.isZero() &&
      this.contractTreeRoot.isZero() &&
      this.privateKernelVkTreeRoot.isZero()
    );
  }

  /**
   * Deserializes from a buffer or reader, corresponding to a write in cpp.
   * @param buffer - Buffer to read from.
   */
  static fromBuffer(buffer: Buffer | BufferReader): PrivateHistoricTreeRoots {
    const reader = BufferReader.asReader(buffer);
    return new PrivateHistoricTreeRoots(reader.readFr(), reader.readFr(), reader.readFr(), reader.readFr());
  }

  static empty() {
    return new PrivateHistoricTreeRoots(Fr.ZERO, Fr.ZERO, Fr.ZERO, Fr.ZERO);
  }
}

export class CombinedHistoricTreeRoots {
  constructor(public readonly privateHistoricTreeRoots: PrivateHistoricTreeRoots) {}

  toBuffer() {
    return serializeToBuffer(this.privateHistoricTreeRoots);
  }

  static fromBuffer(buffer: Buffer | BufferReader) {
    const reader = BufferReader.asReader(buffer);
    return new CombinedHistoricTreeRoots(reader.readObject(PrivateHistoricTreeRoots));
  }

  isEmpty() {
    return this.privateHistoricTreeRoots.isEmpty();
  }

  static empty() {
    return new CombinedHistoricTreeRoots(PrivateHistoricTreeRoots.empty());
  }
}

export class CombinedConstantData {
  constructor(public historicTreeRoots: CombinedHistoricTreeRoots, public txContext: TxContext) {}

  toBuffer() {
    return serializeToBuffer(this.historicTreeRoots, this.txContext);
  }

  /**
   * Deserializes from a buffer or reader, corresponding to a write in cpp.
   * @param buffer - Buffer to read from.
   */
  static fromBuffer(buffer: Buffer | BufferReader): CombinedConstantData {
    const reader = BufferReader.asReader(buffer);
    return new CombinedConstantData(reader.readObject(CombinedHistoricTreeRoots), reader.readObject(TxContext));
  }

  static empty() {
    return new CombinedConstantData(CombinedHistoricTreeRoots.empty(), TxContext.empty());
  }
}
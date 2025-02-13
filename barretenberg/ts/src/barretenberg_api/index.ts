// WARNING: FILE CODE GENERATED BY BINDGEN UTILITY. DO NOT EDIT!
/* eslint-disable @typescript-eslint/no-unused-vars */
import { BarretenbergBinder } from '../barretenberg_binder/index.js';
import {
  BufferDeserializer,
  NumberDeserializer,
  VectorDeserializer,
  BoolDeserializer,
  StringDeserializer,
} from '../serialize/index.js';
import { Fr, Fq, Point, Buffer32, Buffer128, Ptr } from '../types/index.js';

export class BarretenbergApi {
  constructor(public binder: BarretenbergBinder) {}

  async destroy() {
    await this.binder.wasm.destroy();
  }

  async pedersenInit(): Promise<void> {
    const result = await this.binder.callWasmExport('pedersen___init', [], []);
    return;
  }

  async pedersenCommit(inputsBuffer: Fr[]): Promise<Fr> {
    const result = await this.binder.callWasmExport('pedersen___commit', [inputsBuffer], [Fr]);
    return result[0];
  }

  async pedersenHashInit(): Promise<void> {
    const result = await this.binder.callWasmExport('pedersen_hash_init', [], []);
    return;
  }

  async pedersenHashWithHashIndex(inputsBuffer: Fr[], hashIndex: number): Promise<Fr> {
    const result = await this.binder.callWasmExport('pedersen_hash_with_hash_index', [inputsBuffer, hashIndex], [Fr]);
    return result[0];
  }

  async blake2s(data: Uint8Array): Promise<Buffer32> {
    const result = await this.binder.callWasmExport('blake2s', [data], [Buffer32]);
    return result[0];
  }

  async blake2sToField(data: Uint8Array): Promise<Fr> {
    const result = await this.binder.callWasmExport('blake2s_to_field_', [data], [Fr]);
    return result[0];
  }

  async schnorrComputePublicKey(privateKey: Fr): Promise<Point> {
    const result = await this.binder.callWasmExport('schnorr_compute_public_key', [privateKey], [Point]);
    return result[0];
  }

  async schnorrNegatePublicKey(publicKeyBuffer: Point): Promise<Point> {
    const result = await this.binder.callWasmExport('schnorr_negate_public_key', [publicKeyBuffer], [Point]);
    return result[0];
  }

  async schnorrConstructSignature(message: Uint8Array, privateKey: Fr): Promise<[Buffer32, Buffer32]> {
    const result = await this.binder.callWasmExport(
      'schnorr_construct_signature',
      [message, privateKey],
      [Buffer32, Buffer32],
    );
    return result as any;
  }

  async schnorrVerifySignature(message: Uint8Array, pubKey: Point, sigS: Buffer32, sigE: Buffer32): Promise<boolean> {
    const result = await this.binder.callWasmExport(
      'schnorr_verify_signature',
      [message, pubKey, sigS, sigE],
      [BoolDeserializer()],
    );
    return result[0];
  }

  async schnorrMultisigCreateMultisigPublicKey(privateKey: Fq): Promise<Buffer128> {
    const result = await this.binder.callWasmExport(
      'schnorr_multisig_create_multisig_public_key',
      [privateKey],
      [Buffer128],
    );
    return result[0];
  }

  async schnorrMultisigValidateAndCombineSignerPubkeys(signerPubkeyBuf: Buffer128[]): Promise<[Point, boolean]> {
    const result = await this.binder.callWasmExport(
      'schnorr_multisig_validate_and_combine_signer_pubkeys',
      [signerPubkeyBuf],
      [Point, BoolDeserializer()],
    );
    return result as any;
  }

  async schnorrMultisigConstructSignatureRound1(): Promise<[Buffer128, Buffer128]> {
    const result = await this.binder.callWasmExport(
      'schnorr_multisig_construct_signature_round_1',
      [],
      [Buffer128, Buffer128],
    );
    return result as any;
  }

  async schnorrMultisigConstructSignatureRound2(
    message: Uint8Array,
    privateKey: Fq,
    signerRoundOnePrivateBuf: Buffer128,
    signerPubkeysBuf: Buffer128[],
    roundOnePublicBuf: Buffer128[],
  ): Promise<[Fq, boolean]> {
    const result = await this.binder.callWasmExport(
      'schnorr_multisig_construct_signature_round_2',
      [message, privateKey, signerRoundOnePrivateBuf, signerPubkeysBuf, roundOnePublicBuf],
      [Fq, BoolDeserializer()],
    );
    return result as any;
  }

  async schnorrMultisigCombineSignatures(
    message: Uint8Array,
    signerPubkeysBuf: Buffer128[],
    roundOneBuf: Buffer128[],
    roundTwoBuf: Fr[],
  ): Promise<[Buffer32, Buffer32, boolean]> {
    const result = await this.binder.callWasmExport(
      'schnorr_multisig_combine_signatures',
      [message, signerPubkeysBuf, roundOneBuf, roundTwoBuf],
      [Buffer32, Buffer32, BoolDeserializer()],
    );
    return result as any;
  }

  async srsInitSrs(pointsBuf: Uint8Array, numPoints: number, g2PointBuf: Uint8Array): Promise<void> {
    const result = await this.binder.callWasmExport('srs_init_srs', [pointsBuf, numPoints, g2PointBuf], []);
    return;
  }

  async examplesSimpleCreateAndVerifyProof(): Promise<boolean> {
    const result = await this.binder.callWasmExport(
      'examples_simple_create_and_verify_proof',
      [],
      [BoolDeserializer()],
    );
    return result[0];
  }

  async testThreads(threads: number, iterations: number): Promise<number> {
    const result = await this.binder.callWasmExport('test_threads', [threads, iterations], [NumberDeserializer()]);
    return result[0];
  }

  async commonInitSlabAllocator(circuitSize: number): Promise<void> {
    const result = await this.binder.callWasmExport('common_init_slab_allocator', [circuitSize], []);
    return;
  }

  async acirGetCircuitSizes(constraintSystemBuf: Uint8Array): Promise<[number, number, number]> {
    const result = await this.binder.callWasmExport(
      'acir_get_circuit_sizes',
      [constraintSystemBuf],
      [NumberDeserializer(), NumberDeserializer(), NumberDeserializer()],
    );
    return result as any;
  }

  async acirNewAcirComposer(sizeHint: number): Promise<Ptr> {
    const result = await this.binder.callWasmExport('acir_new_acir_composer', [sizeHint], [Ptr]);
    return result[0];
  }

  async acirDeleteAcirComposer(acirComposerPtr: Ptr): Promise<void> {
    const result = await this.binder.callWasmExport('acir_delete_acir_composer', [acirComposerPtr], []);
    return;
  }

  async acirCreateCircuit(acirComposerPtr: Ptr, constraintSystemBuf: Uint8Array, sizeHint: number): Promise<void> {
    const result = await this.binder.callWasmExport(
      'acir_create_circuit',
      [acirComposerPtr, constraintSystemBuf, sizeHint],
      [],
    );
    return;
  }

  async acirInitProvingKey(acirComposerPtr: Ptr, constraintSystemBuf: Uint8Array): Promise<void> {
    const result = await this.binder.callWasmExport(
      'acir_init_proving_key',
      [acirComposerPtr, constraintSystemBuf],
      [],
    );
    return;
  }

  async acirCreateProof(
    acirComposerPtr: Ptr,
    constraintSystemBuf: Uint8Array,
    witnessBuf: Uint8Array,
    isRecursive: boolean,
  ): Promise<Uint8Array> {
    const result = await this.binder.callWasmExport(
      'acir_create_proof',
      [acirComposerPtr, constraintSystemBuf, witnessBuf, isRecursive],
      [BufferDeserializer()],
    );
    return result[0];
  }

  async acirLoadVerificationKey(acirComposerPtr: Ptr, vkBuf: Uint8Array): Promise<void> {
    const result = await this.binder.callWasmExport('acir_load_verification_key', [acirComposerPtr, vkBuf], []);
    return;
  }

  async acirInitVerificationKey(acirComposerPtr: Ptr): Promise<void> {
    const result = await this.binder.callWasmExport('acir_init_verification_key', [acirComposerPtr], []);
    return;
  }

  async acirGetVerificationKey(acirComposerPtr: Ptr): Promise<Uint8Array> {
    const result = await this.binder.callWasmExport(
      'acir_get_verification_key',
      [acirComposerPtr],
      [BufferDeserializer()],
    );
    return result[0];
  }

  async acirVerifyProof(acirComposerPtr: Ptr, proofBuf: Uint8Array, isRecursive: boolean): Promise<boolean> {
    const result = await this.binder.callWasmExport(
      'acir_verify_proof',
      [acirComposerPtr, proofBuf, isRecursive],
      [BoolDeserializer()],
    );
    return result[0];
  }

  async acirGetSolidityVerifier(acirComposerPtr: Ptr): Promise<string> {
    const result = await this.binder.callWasmExport(
      'acir_get_solidity_verifier',
      [acirComposerPtr],
      [StringDeserializer()],
    );
    return result[0];
  }

  async acirSerializeProofIntoFields(
    acirComposerPtr: Ptr,
    proofBuf: Uint8Array,
    numInnerPublicInputs: number,
  ): Promise<Fr[]> {
    const result = await this.binder.callWasmExport(
      'acir_serialize_proof_into_fields',
      [acirComposerPtr, proofBuf, numInnerPublicInputs],
      [VectorDeserializer(Fr)],
    );
    return result[0];
  }

  async acirSerializeVerificationKeyIntoFields(acirComposerPtr: Ptr): Promise<[Fr[], Fr]> {
    const result = await this.binder.callWasmExport(
      'acir_serialize_verification_key_into_fields',
      [acirComposerPtr],
      [VectorDeserializer(Fr), Fr],
    );
    return result as any;
  }
}

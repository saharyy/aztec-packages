// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.18;

import {Test} from "forge-std/Test.sol";

import {Decoder} from "@aztec3/core/Decoder.sol";
import {Rollup} from "@aztec3/core/Rollup.sol";
import {DecoderHelper} from "./DecoderHelper.sol";

// Blocks generated using `l2-block-publisher.test.ts`
contract DecoderTest is Test {
  Rollup internal rollup;
  DecoderHelper internal helper;

  bytes block_1 =
    hex"000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000002d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000082f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd80000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000012b36b22912aa963f143c490227bd21e7a44338026b2f6a389cb98e82167c3718000000012b72136df9bc7dc9cbfe6b84ec743e8e1d73dd93aecfa79f18afb86be977d3eb0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e150000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000010283622796e1a2fa4718e254eb46d3f4287b05a5aaee35af02a54f2af8362f97000000101f99db4b9ffa5ab637607ad50c7d10ea3352a53478e14354355a02b6a87a7ab1000000181ba22861f1a04d910c399ce20125a7ef53c3a47e0f51fe1d2c179ea83b8da34e0000000415db3dd5c4e4589c0b7a5942f81c11548dda500600adefeb8c49d13481a88e24000000022309e4044d29f2906c728a7d19672aa7d80f3fbc289d4dd6fcab93f1e197b727000000020a20b604e286954cd8b1622dcbda5ef1c4ad6bfd80a81ad80dcff2f5080d5ba00668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000010238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed000000020000001000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000000000000000000000000000000000000102000000000000000000000000000000000000000000000000000000000000010300000000000000000000000000000000000000000000000000000000000001040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002010000000000000000000000000000000000000000000000000000000000000202000000000000000000000000000000000000000000000000000000000000020300000000000000000000000000000000000000000000000000000000000002040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000008010000000000000000000000000000000000000000000000000000000000000803000000000000000000000000000000000000000000000000000000000000080200000000000000000000000000000000000000000000000000000000000008040000000000000000000000000000000000000000000000000000000000000803000000000000000000000000000000000000000000000000000000000000080500000000000000000000000000000000000000000000000000000000000008040000000000000000000000000000000000000000000000000000000000000806000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000041b024f6e2e258ac4fa7b3a0d03f9fa242eee6d884ec85d0efd4beca26a88da2100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006010202020202020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  bytes block_2 =
    hex"000000020283622796e1a2fa4718e254eb46d3f4287b05a5aaee35af02a54f2af8362f97000000101f99db4b9ffa5ab637607ad50c7d10ea3352a53478e14354355a02b6a87a7ab1000000181ba22861f1a04d910c399ce20125a7ef53c3a47e0f51fe1d2c179ea83b8da34e0000000415db3dd5c4e4589c0b7a5942f81c11548dda500600adefeb8c49d13481a88e24000000022309e4044d29f2906c728a7d19672aa7d80f3fbc289d4dd6fcab93f1e197b727000000020a20b604e286954cd8b1622dcbda5ef1c4ad6bfd80a81ad80dcff2f5080d5ba00668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000010238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed00000002013ffea42e60a3be0af304384d83ad4411df13f66213997a7f0b7551e242f19d0000002001872181b5fe2c7ea15e1e72f5672bc777d61c807771ff7ae40c9b2aa816323500000028063d7b42d552599d3f3ff8fbc93e55484d49fc20dcc41940e3ebeaac4483a8ba0000000803b6339133ac1ca21463e1e3370ca136862bac1be49bdc6e1e69f73068a22ebe0000000316204b8532027613f551ad0530dc70c1c3be36fb7828a3a6539a100c57d25034000000030aa1281a92ab93a92ea1e45d49ce373a45fdb0b7a988416e63cd0728252a112a0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000020236394e84a01824e286653b542a923474253251e86c118f02978d5714538236c000000030000001000000000000000000000000000000000000000000000000000000000000001020000000000000000000000000000000000000000000000000000000000000103000000000000000000000000000000000000000000000000000000000000010400000000000000000000000000000000000000000000000000000000000001050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000002020000000000000000000000000000000000000000000000000000000000000203000000000000000000000000000000000000000000000000000000000000020400000000000000000000000000000000000000000000000000000000000002050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000008020000000000000000000000000000000000000000000000000000000000000804000000000000000000000000000000000000000000000000000000000000080300000000000000000000000000000000000000000000000000000000000008050000000000000000000000000000000000000000000000000000000000000804000000000000000000000000000000000000000000000000000000000000080600000000000000000000000000000000000000000000000000000000000008050000000000000000000000000000000000000000000000000000000000000807000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000042ddfdac63df2e340ea582ed2b6c9d23bf04f6e98c281c25c6dd7e87251185b3500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006020303030303030303030303030303030303030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  bytes block_empty_1 =
    hex"000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000002d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000082f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd80000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000012b36b22912aa963f143c490227bd21e7a44338026b2f6a389cb98e82167c3718000000012b72136df9bc7dc9cbfe6b84ec743e8e1d73dd93aecfa79f18afb86be977d3eb0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e150000000019c36f7bc2e4116d082865cc0b4ac8e16e9efa00ace9fb2222dd1dfd719cb671000000010668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000102d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000182f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000004238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed0000000225d4ca531bca7d097a93bc47d7aa2c4dbcc8d0d5ecf4138849104e363eb52c03000000022b72136df9bc7dc9cbfe6b84ec743e8e1d73dd93aecfa79f18afb86be977d3eb0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000010238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed00000002000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  bytes block_empty_2 =
    hex"000000020668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000102d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000182f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000004238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed0000000225d4ca531bca7d097a93bc47d7aa2c4dbcc8d0d5ecf4138849104e363eb52c03000000022b72136df9bc7dc9cbfe6b84ec743e8e1d73dd93aecfa79f18afb86be977d3eb0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000010238b20b7bc1d5190f8e928eb2aa2094412588f9cad6c7862f69c09a9b246d6ed000000020668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e15000000202d39729fd006096882acfbd350c91fd61883578b4fe35b63cdce3c1993a497ea000000282f8dc86ba80d8fcf491fb7a255f4163e4f9601d022ba0be35f13297531073fd800000008236394e84a01824e286653b542a923474253251e86c118f02978d5714538236c000000030aaa66ea64a4b9493d7237d092f8276e31eb3f8b14ae5c5e0a91fa5627745a83000000032b72136df9bc7dc9cbfe6b84ec743e8e1d73dd93aecfa79f18afb86be977d3eb0668938c4a4167faa2b5031e427d74d6e38638d2eef68834b70480c5a93f8e1500000020236394e84a01824e286653b542a923474253251e86c118f02978d5714538236c00000003000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

  function setUp() public {
    rollup = new Rollup();
    helper = new DecoderHelper();
  }

  function testEmptyBlocks() public {
    {
      (bytes32 diffRoot, bytes32 l1ToL2MessagesHash) =
        helper.computeDiffRootAndMessagesHash(block_empty_2);
      assertEq(
        diffRoot,
        0x84036b397b37b2dab7c2d95581275797c8d06b432f3826ada23cca6d87d49b84,
        "Invalid diff root"
      );

      assertEq(
        l1ToL2MessagesHash,
        0x076a27c79e5ace2a3d47f9dd2e83e4ff6ea8872b3c2218f66c92b89b55f36560,
        "Invalid messages hash"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_empty_1);

      assertEq(l2BlockNumber, 1, "Invalid block number");
      assertEq(
        startStateHash,
        0x2d5d49acd86a4ce5d71f632bd8c39d61d12c7be4ad4ab1f17e134e55aa4e29c2,
        "Invalid start state hash"
      );
      assertEq(
        endStateHash,
        0x3dff2c815f7e5f5b8b3a2397347cc928001c73e5442d6dad5af61c3329b4fc8c,
        "Invalid end state hash"
      );
      assertEq(
        publicInputsHash,
        0x23f698e487c4e1b7383889f8864bc19591773d136c364c01d980bd13d0786ba1,
        "Invalid public input hash"
      );

      rollup.process(bytes(""), block_empty_1);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }

    {
      (bytes32 diffRoot, bytes32 l1ToL2MessagesHash) =
        helper.computeDiffRootAndMessagesHash(block_empty_2);
      assertEq(
        diffRoot,
        0x84036b397b37b2dab7c2d95581275797c8d06b432f3826ada23cca6d87d49b84,
        "Invalid diff root"
      );

      assertEq(
        l1ToL2MessagesHash,
        0x076a27c79e5ace2a3d47f9dd2e83e4ff6ea8872b3c2218f66c92b89b55f36560,
        "Invalid messages hash"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_empty_2);

      assertEq(l2BlockNumber, 2, "Invalid block number");
      assertEq(
        startStateHash,
        0x3dff2c815f7e5f5b8b3a2397347cc928001c73e5442d6dad5af61c3329b4fc8c,
        "Invalid start state hash"
      );
      assertEq(
        endStateHash,
        0x906b283a0f25f74711aa8e1cdaea18a6e80bebe9ce9118315a0f31433feaffe3,
        "Invalid end state hash"
      );
      assertEq(
        publicInputsHash,
        0x0f6cd26577a7c4edf15eb3785315d9f8dbcbc8a3ffc0dba7e04be4e37b09228f,
        "Invalid public input hash"
      );

      rollup.process(bytes(""), block_empty_2);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }
  }

  function testNonEmptyBlocks() public {
    {
      (bytes32 diffRoot, bytes32 l1ToL2MessagesHash) =
        helper.computeDiffRootAndMessagesHash(block_1);
      assertEq(
        diffRoot,
        0x05ab40c0ddda5b1846c6283c0a99ea7da9ebb3ea46f33225e72e0d0333bf251f,
        "Invalid diff root block 1"
      );

      assertEq(
        l1ToL2MessagesHash,
        0x076a27c79e5ace2a3d47f9dd2e83e4ff6ea8872b3c2218f66c92b89b55f36560,
        "Invalid messages hash"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_1);

      assertEq(l2BlockNumber, 1, "Invalid block number");
      assertEq(
        startStateHash,
        0x2d5d49acd86a4ce5d71f632bd8c39d61d12c7be4ad4ab1f17e134e55aa4e29c2,
        "Invalid start state hash block 1"
      );
      assertEq(
        endStateHash,
        0x8a6161ff9185b2354adadb2a6fbd0a8279d2b7558e617f46cfbd42af3073729c,
        "Invalid end state hash block 1"
      );
      assertEq(
        publicInputsHash,
        0x04b30d90646ca894b0f04cafb6bd76cc7db900dc8cb0a8904b21ff2a6cd4f23e,
        "Invalid public input hash block 1"
      );

      rollup.process(bytes(""), block_1);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash block 1");
    }

    {
      (bytes32 diffRoot, bytes32 l1ToL2MessagesHash) =
        helper.computeDiffRootAndMessagesHash(block_2);
      assertEq(
        diffRoot,
        0x04a10b2ce6eb66a3ae547efacc53760ec64fb86c901f9cadb36c104cc532cb99,
        "Invalid diff root block 2"
      );

      assertEq(
        l1ToL2MessagesHash,
        0x076a27c79e5ace2a3d47f9dd2e83e4ff6ea8872b3c2218f66c92b89b55f36560,
        "Invalid l1 to l2 messages hash block 2"
      );

      (
        uint256 l2BlockNumber,
        bytes32 startStateHash,
        bytes32 endStateHash,
        bytes32 publicInputsHash
      ) = helper.decode(block_2);

      assertEq(l2BlockNumber, 2, "Invalid block number");
      assertEq(
        startStateHash,
        0x8a6161ff9185b2354adadb2a6fbd0a8279d2b7558e617f46cfbd42af3073729c,
        "Invalid start state hash block 2"
      );
      assertEq(
        endStateHash,
        0xd2055c0813616d7073f6bcc905a755ed525e5541b3e5e1b286fd583729c74ea7,
        "Invalid end state hash block 2"
      );
      assertEq(
        publicInputsHash,
        0x22d088d033eac3347d80581f49057fe24d366cdfdaa644ad4a286d4f8280842b,
        "Invalid public input hash block 2"
      );

      rollup.process(bytes(""), block_2);

      assertEq(rollup.rollupStateHash(), endStateHash, "Invalid rollup state hash");
    }
  }
}
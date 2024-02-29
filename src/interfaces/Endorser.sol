
pragma solidity ^0.8.0;


interface Endorser {
  struct BlockDependency {
    uint256 maxNumber;
    uint256 maxTimestamp;
  }

  struct Constraint {
    bytes32 slot;
    bytes32 minValue;
    bytes32 maxValue;
  }

  struct Dependency {
    address addr;
    bool balance;
    bool code;
    bool nonce;
    bool allSlots;
    bytes32[] slots;
    Constraint[] constraints;
  }

  function isOperationReady(
    address _entrypoint,
    bytes calldata _data,
    bytes calldata _endorserCallData,
    uint256 _gasLimit,
    uint256 _maxFeePerGas,
    uint256 _maxPriorityFeePerGas,
    address _feeToken,
    uint256 _feeTokenScaler,
    uint256 _feeTokenScalingFactor,
    bool _hasUntrustedContext
  ) external returns (
    bool readiness,
    BlockDependency memory blockDependency,
    Dependency[] memory dependencies
  );
}

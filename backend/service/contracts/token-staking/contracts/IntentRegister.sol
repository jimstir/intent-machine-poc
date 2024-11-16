  // SPDX-License-Identifier: MIT
  // @author: Jimmy Debe

pragma solidity 0.8.0;
import "token-staking/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../contracts/Staking.sol";
/*
  Intent register allows intent nodes to make transaction on the
  Staking.sol contract on behalf of users. 
*/
abstract contract IntentRegister is Staking {

  // Addresses of intent nodes registered
  mapping (uint256 => address ) private _nodes;
  // Address of user for intentNum
  mapping (uint256 => address ) private _userIntent;
  // Closed intent number, if false intent is open
  mapping (uint256 => bool) private _closedIntent;

  // Number of all intents
  uint256 private _intents;
  // Number of opened intents
  uint256 private _openIntents;
  // Number of completed intents
  uint256 private _completeIntents;
  // Token used ot give rewards
  IERC20 private _token;
  // Token that is used for staking
  address private _stakingToken;
  // Staking.sol
  Staking private _staking;
  //Owner of intentservice
  address private _owner;

  modifier Owner() {
        require(msg.sender == _owner, "Only owner");
        _;
    }

  constructor(address rewardToken ) {
    _stakingToken = rewardToken;
    _staking = new Staking(_stakingToken, 1, 20, 1, msg.sender);
    _owner = msg.sender;
  }

  // Service add funds to pay for intent machine fees
  // Add random number and intent nodes collect fixed number?
  function addFunds(uint256 amount) public {
    require(IERC20(_token).transferFrom(msg.sender, address(this), amount));
  }

  // register intent node address, service assigns intent number to intent node.
  // Intent node should call this
  function register(address user, address node) public onlyOwner  {
    require(msg.sender != _nodes[_intents] );
    _intents = _intents + 1;
    _nodes[_intents] = node;
    _userIntent[_intents] = user;

  }

  // Add new intent by making a transaction after user approval to lockTokens()
  // @notice 
  // @notice add a new intent number if newIntent

  function addIntent(address user, uint256 intentNum) public {
    require(msg.sender == _nodes[intentNum]);
    require(msg.sender == _userIntent[intentNum]);
    _staking.lockTokens(100, 1, user);

  }

  // Do an intent step for an open intent 
  // @notice Use this function for an already open intent to keep track
  // of intents made by node
  function intentClose(uint256 intentNum, address user) public {
    require(msg.sender == _nodes[intentNum]);
    require(msg.sender == _userIntent[intentNum]);
    _staking.unlockTokens(user);

  }

  // Close after intent is closed. Use getRewards() and send to user of intent

  // Add intent network fees. 
  // here once an intent is closed, the node assigned to intent is rewarded 1000 USDC*
  function getRewards(uint256 intentNum, address user) public {
    require(_closedIntent[intentNum] == false);
    require(msg.sender == _nodes[intentNum]);
    _staking.getRewards(user);
    _staking.release(user);
  }
}
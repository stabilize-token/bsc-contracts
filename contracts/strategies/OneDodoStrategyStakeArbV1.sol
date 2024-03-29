// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);
    
    function decimals() external view returns (uint8);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

pragma solidity ^0.6.2;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // According to EIP-1052, 0x0 is the value returned for not-yet created accounts
        // and 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470 is returned
        // for accounts without code, i.e. `keccak256('')`
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain`call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return _functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        return _functionCallWithValue(target, data, value, errorMessage);
    }

    function _functionCallWithValue(address target, bytes memory data, uint256 weiValue, string memory errorMessage) private returns (bytes memory) {
        require(isContract(target), "Address: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = target.call{ value: weiValue }(data);
        if (success) {
            return returndata;
        } else {
            // Look for revert reason and bubble it up if present
            if (returndata.length > 0) {
                // The easiest way to bubble the revert reason is using memory via assembly

                // solhint-disable-next-line no-inline-assembly
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

pragma solidity ^0.6.0;

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value, "SafeERC20: decreased allowance below zero");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address.functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/GSN/Context.sol

pragma solidity ^0.6.0;

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address payable) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol

pragma solidity ^0.6.0;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
    address private _governance;

    event GovernanceTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor () internal {
        address msgSender = _msgSender();
        _governance = msgSender;
        emit GovernanceTransferred(address(0), msgSender);
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function governance() public view returns (address) {
        return _governance;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyGovernance() {
        require(_governance == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferGovernance(address newOwner) internal virtual onlyGovernance {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit GovernanceTransferred(_governance, newOwner);
        _governance = newOwner;
    }
}

// File: contracts/strategies/OneDodoStrategyStakeArbV1.sol

pragma solidity =0.6.6;

interface StabilizeStakingPool {
    function notifyRewardAmount(uint256) external;
    function getTotalSTBB() external view returns (uint256);
    function getCurrentStrategy() external view returns (address);
}

interface TradeRouter {
    function swapExactETHForTokens(uint, address[] calldata, address, uint) external payable returns (uint[] memory); // Pancake
    function swapExactTokensForTokens(uint, uint, address[] calldata, address, uint) external returns (uint[] memory);
    function getAmountsOut(uint, address[] calldata) external view returns (uint[] memory); // For a value in, it calculates value out
}

interface StakingPool{
    function balanceOf(address _address) external view returns (uint256);
    function getPendingReward(address _user, uint256 _rewardID) external view returns (uint256);
    function claimReward(uint256 rewardID) external;
    function deposit(uint256 _amount) external;
    function withdraw(uint256 _amount) external; // This does not autoclaim reward
}

interface DodoRouter{
    function dodoSwapV2TokenToToken(
        address fromToken,
        address toToken,
        uint256 fromTokenAmount,
        uint256 minReturnAmount,
        address[] calldata dodoPairs,
        uint256 directions,
        bool isIncentive,
        uint256 deadLine
    ) external returns (uint256 returnAmount);
    function _DODO_APPROVE_PROXY_() external view returns (address);
}

interface DodoLiquidityRouter{
    function addDSPLiquidity(
        address dspAddress,
        uint256 baseInAmount,
        uint256 quoteInAmount,
        uint256 baseMinAmount,
        uint256 quoteMinAmount,
        uint8 flag, // 0 - ERC20, 1 - baseInETH, 2 - quoteInETH
        uint256 deadLine
    )
        external
        returns (
            uint256 shares,
            uint256 baseAdjustedInAmount,
            uint256 quoteAdjustedInAmount
        );
}

interface DodoPool{
    function sellShares(
        uint256 shareAmount,
        address to,
        uint256 baseMinAmount,
        uint256 quoteMinAmount,
        bytes calldata data,
        uint256 deadline
    ) external returns (uint256 baseAmount, uint256 quoteAmount);
    function querySellBase(address trader, uint256 payBaseAmount)
        external
        view
        returns (
            uint256 receiveQuoteAmount
        );
    function querySellQuote(address trader, uint256 payQuoteAmount)
        external
        view
        returns (
            uint256 receiveBaseAmount
        );
    function _BASE_TOKEN_() external view returns (address);
}

interface DodoApproveProxy{
    function _DODO_APPROVE_() external view returns (address);
}


// This will arb across multiple tokens

contract OneDodoStrategyStakeArbV1 is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;
    
    address public treasuryAddress; // Address of the treasury
    address public zsbTokenAddress; // The address of the controlling zsb-Token

    uint256 constant DIVISION_FACTOR = 100000;
    
    uint256 public gasPrice = 10e9; // Gas price in wei, not constant
    uint256 public lastTradeTime;
    uint256 public lastActionBalance; // Balance before last deposit, withdraw or trade
    uint256 public percentTradeTrigger = 10000; // 10% change in value will trigger a trade
    uint256 public maxPercentSell = 100000; // 100% of the tokens are sold to the cheapest token
    uint256 public maxAmountSell = 400000; // The maximum amount of tokens that can be sold at once
    uint256 public percentDepositor = 50000; // 1000 = 1%, depositors earn 50% of all arb gains
    uint256 public percentStakeDepositor = 90000; // depositors earn 90% of all stake gains
    uint256 public percentExecutor = 10000; // 10000 = 10% of WBNB goes to executor on top of gas stipend
    uint256 public percentStakers = 50000; // 50000 = 50% of WBNB goes to strat stakers
    uint256 public maxPercentStipend = 50000; // The maximum amount of WBNB profit that can be allocated to the executor for gas in percent
    uint256 public gasStipend = 1800000; // This is the gas units that are covered by executing a trade taken from the WBNB profit    
    uint256 public minAmountProfit = 1e18; // Total profit must be greater than 1 token for executor to earn from trade
    uint256 public minTradeSplit = 20000; // Minimum amount required before selling a percent of tokens
    uint256 public minReservePercent = 45000; // Strategy wants to hold at least 45% of either token at all times (in either LP or raw)
    uint256 public maxLiquidityPercent = 90000; // The maximum amount of each token we are willing to put in LP

    bool public emergencyWithdrawMode = false; // Activated in case tokens get stuck in strategy after timelock

    // Token information
    // oneDODO, USDC
    struct TokenInfo {
        IERC20 token; // Reference of token
        uint256 decimals; // Decimals of token
    }
    
    TokenInfo[] private tokenList; // An array of tokens accepted as deposits
    
    // Strategy specific variables
    address constant WBNB_ADDRESS = address(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c); // WBNB address
    address constant DODO_TOKEN_ADDRESS = address(0x67ee3Cb086F8a16f34beE3ca72FAD36F7Db929e2);
    uint256 constant WBNB_TOKEN_ID = 2;
    
    address constant PANCAKE_ROUTER = address(0x10ED43C718714eb63d5aA57B78B54704E256024E); // Router v2
    address constant DODO_ROUTER = address(0x8F8Dd7DB1bDA5eD3da8C9daf3bfa471c12d58486);
    address constant DODO_LIQUIDITY_PROXY = address(0x2442A8B5cdf1E659F3F949A7E454Caa554D4E65a);
    address constant ONEDODO_USDC_LP_TOKEN = address(0x018E41228b1ebc2f81897150877EDBB682272C64);
    address constant DODO_WBNB_LP_TOKEN = address(0xD534fAE679f7F02364D177E9D44F1D15963c0Dd7);
    address constant LP_STAKING_POOL = address(0x4be2d9251849DB6d3980cE3E13915980C1AE3065);

    constructor(
        address _treasury,
        address _zsbToken
    ) public {
        treasuryAddress = _treasury;
        zsbTokenAddress = _zsbToken;
        setupWithdrawTokens();
    }

    // Initialization functions
    
    function setupWithdrawTokens() internal {
        // Start with oneDODO
        IERC20 _token = IERC20(address(0x2C30B4cB4b3001afa5b8c43c5a7CA548067562A0));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals()
            })
        );   
        
        // USDC
        _token = IERC20(address(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals()
            })
        );
    }
    
    // Modifier
    modifier onlyZSBToken() {
        require(zsbTokenAddress == _msgSender(), "Call not sent from the zsb-Token");
        _;
    }
    
    // Read functions
    
    function rewardTokensCount() external view returns (uint256) {
        return tokenList.length;
    }
    
    function rewardTokenAddress(uint256 _pos) external view returns (address) {
        require(_pos < tokenList.length,"No token at that position");
        return address(tokenList[_pos].token);
    }
    
    function balance() public view returns (uint256) {
        return getNormalizedTotalBalance(address(this));
    }
    
    function getNormalizedTotalBalance(address _address) public view returns (uint256) {
        // Get the balance of the tokens at this address
        uint256 _balance = 0;
        uint256 _length = tokenList.length;
        for(uint256 i = 0; i < _length; i++){
            uint256 _bal = tokenList[i].token.balanceOf(_address);
            _bal = _bal.add(getTokenInLPShare(address(tokenList[i].token), _address)); // Add the amount of token in LP position
            _bal = _bal.mul(1e18).div(10**tokenList[i].decimals);
            _balance = _balance.add(_bal); // This has been normalized to 1e18 decimals
        }
        return _balance;
    }

    function getTokenInLPShare(address _token, address _address) public view returns (uint256) {
        IERC20 token = IERC20(_token);
        IERC20 lpToken = IERC20(ONEDODO_USDC_LP_TOKEN);
        uint256 tokenTotal = token.balanceOf(ONEDODO_USDC_LP_TOKEN); // Total amount of tokens in the LP pool
        uint256 lpBalance = lpToken.balanceOf(address(_address));
        StakingPool pool = StakingPool(LP_STAKING_POOL);
        uint256 _bal = pool.balanceOf(address(this));
        lpBalance = lpBalance.add(_bal);
        if(lpBalance == 0){return 0;}
        return tokenTotal.mul(lpBalance).div(lpToken.totalSupply());
    }
    
    function withdrawTokenReserves() public view returns (address, uint256) {
        // This function will return the address and amount of the token with the highest balance
        (uint256 targetID, uint256 _bal) = withdrawTokenReservesID();
        if(_bal == 0){
            return (address(0), _bal);
        }else{
            return (address(tokenList[targetID].token), _bal);
        }
    }
    
    function withdrawTokenReservesID() internal view returns (uint256, uint256) {
        // This function will return the ID and amount of the token with the highest balance
        uint256 length = tokenList.length;
        uint256 targetID = 0;
        uint256 targetNormBalance = 0;
        for(uint256 i = 0; i < length; i++){
            uint256 _normBal = tokenList[i].token.balanceOf(address(this));
            _normBal = _normBal.add(getTokenInLPShare(address(tokenList[i].token), address(this)));
            _normBal = _normBal.mul(1e18).div(10**tokenList[targetID].decimals);
            if(_normBal > 0){
                if(targetNormBalance == 0 || _normBal >= targetNormBalance){
                    targetNormBalance = _normBal;
                    targetID = i;
                }
            }
        }
        if(targetNormBalance > 0){
            return (targetID, targetNormBalance.mul(10**tokenList[targetID].decimals).div(1e18));
        }else{
            return (0, 0); // No balance
        }        
    }
    
    // Write functions
    
    function enter() external onlyZSBToken {
        deposit(false);
    }
    
    function exit() external onlyZSBToken {
        // The ZS token vault is removing all tokens from this strategy
        withdraw(_msgSender(),1,1, false);
    }
    
    function deposit(bool nonContract) public onlyZSBToken {
        require(emergencyWithdrawMode == false, "Cannot deposit in emergency mode");
        // Only the ZS token can call the function
        
        // No trading is performed on deposit
        if(nonContract == true){}
        lastActionBalance = balance(); // This action balance represents pool post stablecoin deposit
    }
    
    function withdraw(address _depositor, uint256 _share, uint256 _total, bool nonContract) public onlyZSBToken returns (uint256) {
        require(balance() > 0, "There are no tokens in this strategy");
        if(nonContract == true){
            if( _share > _total.mul(percentTradeTrigger).div(DIVISION_FACTOR)){
                uint256 buyID = getCheapestToken();
                checkAndSwapToken(address(0), buyID);
            }
        }
        
        uint256 withdrawAmount = 0;
        uint256 _balance = balance();
        if(_share < _total){
            uint256 _myBalance = _balance.mul(_share).div(_total);

            // Determine if we need to unstake or not. Small amounts do not normally require unstaking
            (uint256 reserveID, ) = withdrawTokenReservesID();
            uint256 inBalance = tokenList[reserveID].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[reserveID].decimals);
            if(inBalance < _myBalance){
                // We need to unstake the tokens
                unstakeAndRemoveFromLiquidityPool();
            }

            withdrawPerBalance(_depositor, _myBalance, false); // This will withdraw based on token balance
            withdrawAmount = _myBalance;
            if(inBalance < _myBalance){
                // Restake the tokens
                addToLiquidityPoolAndStake();
            }
        }else{
            // We are all shares, transfer all
            unstakeAndRemoveFromLiquidityPool();
            withdrawPerBalance(_depositor, _balance, true);
            withdrawAmount = _balance;
        }       
        lastActionBalance = balance();
        
        return withdrawAmount;
    }
    
    // This will withdraw the tokens from the contract based on their balance, from highest balance to lowest
    function withdrawPerBalance(address _receiver, uint256 _withdrawAmount, bool _takeAll) internal {
        uint256 length = tokenList.length;
        if(_takeAll == true){
            // Send the entire balance
            for(uint256 i = 0; i < length; i++){
                uint256 _bal = tokenList[i].token.balanceOf(address(this));
                if(_bal > 0){
                    tokenList[i].token.safeTransfer(_receiver, _bal);
                }
            }
            return;
        }
        bool[] memory done = new bool[](length);
        uint256 targetID = 0;
        uint256 targetNormBalance = 0;
        for(uint256 i = 0; i < length; i++){
            
            targetNormBalance = 0; // Reset the target balance
            // Find the highest balanced token to withdraw
            for(uint256 i2 = 0; i2 < length; i2++){
                if(done[i2] == false){
                    uint256 _normBal = tokenList[i2].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[i2].decimals);
                    if(targetNormBalance == 0 || _normBal >= targetNormBalance){
                        targetNormBalance = _normBal;
                        targetID = i2;
                    }
                }
            }
            done[targetID] = true;
            
            // Determine the balance left
            uint256 _normalizedBalance = tokenList[targetID].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[targetID].decimals);
            if(_normalizedBalance <= _withdrawAmount){
                // Withdraw the entire balance of this token
                if(_normalizedBalance > 0){
                    _withdrawAmount = _withdrawAmount.sub(_normalizedBalance);
                    tokenList[targetID].token.safeTransfer(_receiver, tokenList[targetID].token.balanceOf(address(this)));                    
                }
            }else{
                // Withdraw a partial amount of this token
                if(_withdrawAmount > 0){
                    // Convert the withdraw amount to the token's decimal amount
                    uint256 _balance = _withdrawAmount.mul(10**tokenList[targetID].decimals).div(1e18);
                    _withdrawAmount = 0;
                    tokenList[targetID].token.safeTransfer(_receiver, _balance);
                }
                break; // Nothing more to withdraw
            }
        }
    }
    
    // Test functions
    /*
    function testDeposit(uint256 _tokenID) external payable {
        // Must interface: function swapExactETHForTokens(uint, address[] calldata, address, uint) external payable returns (uint[] memory);
        address[] memory path;
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        path = new address[](2);
        path[0] = WBNB_ADDRESS;
        path[1] = address(tokenList[1].token); // First get USDC
        uint256 _amount = tokenList[1].token.balanceOf(address(this));
        router.swapExactETHForTokens{value: msg.value}(1, path, address(this), now.add(60));
        _amount = tokenList[1].token.balanceOf(address(this)).sub(_amount);
        if(_tokenID != 1){
            exchange(1, _tokenID, _amount); // Convert to other token       
        }
    }

    function testDodoDeposit() external payable {
        address[] memory path;
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        path = new address[](2);
        path[0] = WBNB_ADDRESS;
        path[1] = DODO_TOKEN_ADDRESS;
        router.swapExactETHForTokens{value: msg.value}(1, path, address(this), now.add(60));        
    }
    */

    // Dodo specific functions
    function calculateDodoReturn(address dodoAddress, address inputAddress, address outputAddress, uint256 _amount) internal view returns (uint256)
    {
        if(outputAddress==inputAddress){}
        // First determine which one is the quote
        uint256 direction = 0; // Selling base
        DodoPool pool = DodoPool(dodoAddress);
        if(pool._BASE_TOKEN_() != inputAddress){
            direction = 1; // We are selling quote token
        }
        if(direction == 1){
            // Selling quote
            return pool.querySellQuote(address(this), _amount);
        }else{
            return pool.querySellBase(address(this), _amount);
        }
    }

    function swapViaDodoV2(address dodoAddress, address inputAddress, address outputAddress, uint256 _amount) internal {
        uint256 direction = 0; // Selling base
        if(DodoPool(dodoAddress)._BASE_TOKEN_() != inputAddress){
            direction = 1; // We are selling quote token
        }        
        address[] memory path = new address[](1);
        address approver = DodoApproveProxy(DodoRouter(DODO_ROUTER)._DODO_APPROVE_PROXY_())._DODO_APPROVE_();
        path[0] = dodoAddress;
        IERC20(inputAddress).safeApprove(approver, 0);
        IERC20(inputAddress).safeApprove(approver, _amount);
        DodoRouter(DODO_ROUTER).dodoSwapV2TokenToToken(inputAddress, outputAddress, _amount, 1, path, direction, false, now.add(60));
    }
    
    function simulateExchange(uint256 _idIn, uint256 _idOut, uint256 _amount) internal view returns (uint256) {
        address[] memory path;
        uint256[] memory estimates;
        if(_idOut == WBNB_TOKEN_ID){
            if(_idIn == 0){
                // Convert oneDODO to USDC
                _amount = calculateDodoReturn(ONEDODO_USDC_LP_TOKEN, address(tokenList[_idIn].token), address(tokenList[1].token), _amount);
            }
            // Then convert USDC to WBNB
            path = new address[](2);
            path[0] = address(tokenList[1].token);
            path[1] = WBNB_ADDRESS;
            TradeRouter router = TradeRouter(PANCAKE_ROUTER);
            estimates = router.getAmountsOut(_amount, path);
            _amount = estimates[estimates.length - 1]; // This is the amount of WBNB returned
            return _amount;
        }else{
            // Dodoswap
            _amount = calculateDodoReturn(ONEDODO_USDC_LP_TOKEN, address(tokenList[_idIn].token), address(tokenList[_idOut].token), _amount);
            return _amount;
        }
    }
    
    function exchange(uint256 _idIn, uint256 _idOut, uint256 _amount) internal {
        address[] memory path;
        if(_idOut == WBNB_TOKEN_ID){
            if(_idIn == 0){
                // Convert oneDODO to USDC
                uint256 _bal = tokenList[1].token.balanceOf(address(this));
                swapViaDodoV2(ONEDODO_USDC_LP_TOKEN, address(tokenList[_idIn].token), address(tokenList[1].token), _amount);
                _amount = tokenList[1].token.balanceOf(address(this)).sub(_bal);
            }
            // Then convert USDC to WBNB
            path = new address[](2);
            path[0] = address(tokenList[1].token);
            path[1] = WBNB_ADDRESS;
            TradeRouter router = TradeRouter(PANCAKE_ROUTER);
            tokenList[1].token.safeApprove(PANCAKE_ROUTER, 0);
            tokenList[1].token.safeApprove(PANCAKE_ROUTER, _amount);
            router.swapExactTokensForTokens(_amount, 1, path, address(this), now.add(60)); // Get WBNB from token
        }else{
            // Dodoswap
            swapViaDodoV2(ONEDODO_USDC_LP_TOKEN, address(tokenList[_idIn].token), address(tokenList[_idOut].token), _amount);
        }    
    }

    function getCheapestToken() internal view returns (uint256) {
        // This will give us the ID of the cheapest token
        // The higher the return, the lower the price of the other token
        uint256 targetID = 0;
        uint256 mainAmount = uint256(1).mul(10**tokenList[0].decimals);
        uint256 highAmount = mainAmount;
        for(uint256 i = 1; i < tokenList.length; i++){
            // Normalize the estimate into first token decimals
            uint256 estimate = simulateExchange(0,i,mainAmount);
            estimate = estimate.mul(10**tokenList[0].decimals).div(10**tokenList[i].decimals);
            if(estimate > highAmount){
                // This token is worth less than the main token
                highAmount = estimate;
                targetID = i;
            }
        }
        return targetID;
    }
    
    function estimateSellAtMaxAmount(uint256 originID, uint256 targetID, uint256 _tokenBalance) internal view returns (uint256) {

        // Discover the price with near 0 slip
        uint256 _minAmount = _tokenBalance.mul(maxPercentSell.div(1000)).div(DIVISION_FACTOR);
        if(_minAmount == 0){ return 0; } // Nothing to sell, can't calculate
        uint256 _minReturn = _minAmount.mul(10**tokenList[targetID].decimals).div(10**tokenList[originID].decimals); // Convert decimals
        uint256 _return = simulateExchange(originID, targetID, _minAmount);
        if(_return <= _minReturn){
            return 0; // We are not going to gain from this trade
        }
        _return = _return.mul(10**tokenList[originID].decimals).div(10**tokenList[targetID].decimals); // Convert to origin decimals
        uint256 _startPrice = _return.mul(1e18).div(_minAmount);
        
        // Now get the price at a higher amount, expected to be lower due to slippage
        uint256 _bigAmount = _tokenBalance.mul(maxPercentSell).div(DIVISION_FACTOR);
        _return = simulateExchange(originID, targetID, _bigAmount);
        _return = _return.mul(10**tokenList[originID].decimals).div(10**tokenList[targetID].decimals); // Convert to origin decimals
        uint256 _endPrice = _return.mul(1e18).div(_bigAmount);
        if(_endPrice >= _startPrice){
            // Really good liquidity
            return _bigAmount;
        }
        
        // Else calculate amount at max profit
        uint256 scaleFactor = uint256(1).mul(10**tokenList[originID].decimals);
        uint256 _targetAmount = _startPrice.sub(1e18).mul(scaleFactor).div(_startPrice.sub(_endPrice).mul(scaleFactor).div(_bigAmount.sub(_minAmount))).div(2);
        if(_targetAmount > _bigAmount){
            // Cannot create an estimate larger than what we want to sell
            return _bigAmount;
        }
        return _targetAmount;
    }

    function maxCeilingSell(uint256 _tokenID, uint256 _totalBalance) internal view returns (uint256) {
        // This will factor the maxAmountSell to determine how much we can sell and still maintain a reserve percentage
        uint256 minReserve = _totalBalance.mul(minReservePercent).div(DIVISION_FACTOR);
        minReserve = minReserve.mul(10**tokenList[_tokenID].decimals).div(1e18); // Convert to right decimals
        uint256 tokenBalance = tokenList[_tokenID].token.balanceOf(address(this));
        if(tokenBalance <= minReserve){
            // Do not sell anymore of this token as we have less than our reserve amount
            return 0;
        }else{
            uint256 sellAmount = tokenBalance.sub(minReserve);
            uint256 maxTarget = maxAmountSell.mul(10**tokenList[_tokenID].decimals);
            if(sellAmount > maxTarget){
                return maxTarget;
            }else{
                return sellAmount;
            }
        }
    }

    function addToLiquidityPoolAndStake() internal {
        // This function will add up liquidity to pool
        uint256 maxAmount1 = tokenList[0].token.balanceOf(address(this)).mul(maxLiquidityPercent).div(DIVISION_FACTOR);
        uint256 maxAmount2 = tokenList[1].token.balanceOf(address(this)).mul(maxLiquidityPercent).div(DIVISION_FACTOR);
        if(maxAmount1 == 0 || maxAmount2 == 0){return;}
        // We want to keep a certain percentage of each token outside of LP pool
        DodoLiquidityRouter router = DodoLiquidityRouter(DODO_LIQUIDITY_PROXY);
        address approver = DodoApproveProxy(DodoRouter(DODO_ROUTER)._DODO_APPROVE_PROXY_())._DODO_APPROVE_();
        tokenList[0].token.safeApprove(approver, 0);
        tokenList[1].token.safeApprove(approver, 0);
        tokenList[0].token.safeApprove(approver, maxAmount1);
        tokenList[1].token.safeApprove(approver, maxAmount2);
        // Add liquidity up to the smaller balance
        router.addDSPLiquidity(ONEDODO_USDC_LP_TOKEN, maxAmount1, maxAmount2, 1, 1, 0, now.add(60));

        // Now we have LP tokens
        StakingPool pool = StakingPool(LP_STAKING_POOL);
        IERC20 lpToken = IERC20(ONEDODO_USDC_LP_TOKEN);
        uint256 _bal = lpToken.balanceOf(address(this));
        lpToken.safeApprove(address(pool), 0);
        lpToken.safeApprove(address(pool), _bal);
        pool.deposit(_bal);
    }

    function handleDodoSwap() internal {
        IERC20 dodo = IERC20(DODO_TOKEN_ADDRESS);
        uint256 _bal = dodo.balanceOf(address(this));
        if(_bal == 0){return;}
        address[] memory path;

        // Convert to BNB first
        swapViaDodoV2(DODO_WBNB_LP_TOKEN, DODO_TOKEN_ADDRESS, WBNB_ADDRESS, _bal);

        // We will convert some WBNB to USDC
        _bal = IERC20(WBNB_ADDRESS).balanceOf(address(this));
        _bal = _bal.mul(percentStakeDepositor).div(DIVISION_FACTOR); // Amount going to pool holders
        if(_bal == 0){return;}
        path = new address[](2);
        path[0] = WBNB_ADDRESS;
        path[1] = address(tokenList[1].token);
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        IERC20(WBNB_ADDRESS).safeApprove(address(router), 0);
        IERC20(WBNB_ADDRESS).safeApprove(address(router), _bal);
        router.swapExactTokensForTokens(_bal, 1, path, address(this), now.add(60)); // Get USDC from WBNB
    }

    function calculateDodoSwap() internal view returns (uint256) {
        StakingPool pool = StakingPool(LP_STAKING_POOL);
        uint256 reward = pool.getPendingReward(address(this), 0);
        if(reward == 0){ return 0; }
        reward = reward.mul(DIVISION_FACTOR.sub(percentStakeDepositor)).div(DIVISION_FACTOR); // Executors can only get a certain percent
        uint256 _amount = calculateDodoReturn(DODO_WBNB_LP_TOKEN, DODO_TOKEN_ADDRESS, WBNB_ADDRESS, reward);
        _amount = _amount.add(IERC20(WBNB_ADDRESS).balanceOf(address(this))); // Add any additional balance sitting here
        return _amount; // This is the amount of WBNB returned
    }

    function unstakeAndRemoveFromLiquidityPool() internal {
        // Unstake the LP tokens
        // Receive the dodo rewards and convert it to WBNB/USDC
        StakingPool pool = StakingPool(LP_STAKING_POOL);
        uint256 _bal = pool.balanceOf(address(this));
        if(_bal > 0){
            pool.withdraw(_bal); // This will pull the tokens
            pool.claimReward(0); // And pull reward
        }

        handleDodoSwap(); // Will Convert Dodo to WBNB/USDC

        // Then unwrap back to native tokens
        IERC20 lpToken = IERC20(ONEDODO_USDC_LP_TOKEN);
        if(lpToken.balanceOf(address(this)) == 0){return;}
        DodoPool lpPool = DodoPool(ONEDODO_USDC_LP_TOKEN);
        bytes memory nulldata;
        lpPool.sellShares(lpToken.balanceOf(address(this)), address(this), 1, 1, nulldata, now.add(60));
    }
    
    function checkAndSwapToken(address _executor, uint256 targetID) internal {
        require(targetID < tokenList.length, "Token ID outside range");
        // To save even more gas, we require the executor to know which tokens to buy
        lastTradeTime = now;

        unstakeAndRemoveFromLiquidityPool();
        
        // Now sell all the other tokens into this token
        uint256 _totalBalance = balance(); // Get the token balance at this contract, should increase
        uint256 _allocatedStipend = gasStipend;
        bool _expectIncrease = false;
        {
            for(uint256 _tokenID = 0; _tokenID < tokenList.length; _tokenID++){
                if(targetID == _tokenID){continue;}
                // Just sell normally
                uint256 sellBalance = 0;
                uint256 _minTradeTarget = minTradeSplit.mul(10**tokenList[_tokenID].decimals);
                uint256 _bal = tokenList[_tokenID].token.balanceOf(address(this));
                if(_bal <= _minTradeTarget){
                    sellBalance = _bal;
                }else{
                    sellBalance = estimateSellAtMaxAmount(_tokenID, targetID, _bal);
                }
                uint256 _maxTradeTarget = maxCeilingSell(_tokenID, _totalBalance);
                if(sellBalance > _maxTradeTarget){
                    sellBalance = _maxTradeTarget;
                }
                if(sellBalance > 0){
                    uint256 minReceiveBalance = sellBalance.mul(10**tokenList[targetID].decimals).div(10**tokenList[_tokenID].decimals); // Change to match decimals of destination
                    uint256 estimate = simulateExchange(_tokenID, targetID, sellBalance);
                    if(estimate > minReceiveBalance){
                        _expectIncrease = true;
                        // We are getting a greater number of tokens, complete the exchange
                        exchange(_tokenID, targetID, sellBalance);
                    }
                }
            }                
        }
        
        uint256 _newBalance = balance();
        if(_expectIncrease == true){
            // There may be rare scenarios where we don't gain any by calling this function
            require(_newBalance > _totalBalance, "Failed to gain in balance from selling tokens");
        }
        
        uint256 gain = _newBalance.sub(_totalBalance);
        if(gain > minAmountProfit){
            uint256 sellBalance = gain.mul(10**tokenList[targetID].decimals).div(1e18);
            sellBalance = sellBalance.mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR);
            if(sellBalance <= tokenList[targetID].token.balanceOf(address(this))){
                exchange(targetID, WBNB_TOKEN_ID, sellBalance); // This is params for WBNB buy
            }
        }

        // Now restake
        addToLiquidityPoolAndStake();
        
        // Now take some gain bnb and distribute it to executor, stakers and treasury
        IERC20 bnb = IERC20(WBNB_ADDRESS);
        uint256 bnbBalance = bnb.balanceOf(address(this));
        if(bnbBalance > 0){
            // This is pure profit, figure out allocation
            // Split the amount sent to the treasury, stakers and executor if one exists
            if(_executor != address(0)){
                uint256 gasFee = gasPrice.mul(_allocatedStipend);
                uint256 executorAmount = gasFee;
                if(gasFee >= bnbBalance.mul(maxPercentStipend).div(DIVISION_FACTOR)){
                    executorAmount = bnbBalance.mul(maxPercentStipend).div(DIVISION_FACTOR); // The executor will get the entire amount up to point
                }else{
                    // Add the executor percent on top of gas fee
                    executorAmount = bnbBalance.sub(gasFee).mul(percentExecutor).div(DIVISION_FACTOR).add(gasFee);
                }
                if(executorAmount > 0){
                    bnb.safeTransfer(_executor, executorAmount);
                    bnbBalance = bnb.balanceOf(address(this)); // Recalculate BNB in contract           
                }
            }
            if(bnbBalance > 0){
                uint256 stakersAmount = bnbBalance.mul(percentStakers).div(DIVISION_FACTOR);
                uint256 treasuryAmount = bnbBalance.sub(stakersAmount);
                if(treasuryAmount > 0){
                    bnb.safeTransfer(treasuryAddress, treasuryAmount);
                }
                if(stakersAmount > 0){
                    bool sendToStaking = true;
                    if(zsbTokenAddress == address(0)){
                        // No staking pool exists
                        sendToStaking = false;
                    }else{
                        // Staking pool exists
                        if(StabilizeStakingPool(zsbTokenAddress).getTotalSTBB() == 0){
                            // There are no tokens at the staking pool
                            sendToStaking = false;
                        }
                        if(StabilizeStakingPool(zsbTokenAddress).getCurrentStrategy() != address(this)){
                            // This strategy cannot send tokens to the token vault
                            sendToStaking = false;
                        }
                    }
                    if(sendToStaking == true){
                        bnb.safeTransfer(zsbTokenAddress, stakersAmount);
                        StabilizeStakingPool(zsbTokenAddress).notifyRewardAmount(stakersAmount);                                
                    }else{
                        bnb.safeTransfer(treasuryAddress, stakersAmount);
                    }
                }
            }
        }
    }
    
    // Accepts param bool to to whether to show profit in total profit wei or executor profit (in BNB) wei
    // Also a bool to check the flash module for potential profit
    // Returns 1) profit, 2) uint256 tokenID to buy, 3) uint256 blocknumber
    function expectedProfit() external view returns (uint256,uint256,uint256) {
        // This view will return the expected profit in wei units that a trading activity will have on the pool
        // It will also return the exchange to sell the token into the target token
        
        // Now sell all the other tokens into this token
        uint256 _normalizedGain = 0;
        uint256 _allocatedStipend = gasStipend;
        uint256 targetID;
        {
            // Go through the token and find the cheapest token
            targetID = getCheapestToken();
            for(uint256 _tokenID = 0; _tokenID < tokenList.length; _tokenID++){
                if(targetID == _tokenID){continue;}
                // Just sell normally
                uint256 sellBalance = 0;
                uint256 _minTradeTarget = minTradeSplit.mul(10**tokenList[_tokenID].decimals);
                uint256 _bal = tokenList[_tokenID].token.balanceOf(address(this));
                if(_bal <= _minTradeTarget){
                    sellBalance = _bal;
                }else{
                    sellBalance = estimateSellAtMaxAmount(_tokenID, targetID, _bal);
                }
                uint256 _maxTradeTarget = maxCeilingSell(_tokenID, balance());
                if(sellBalance > _maxTradeTarget){
                    sellBalance = _maxTradeTarget;
                }
                if(sellBalance > 0){
                    uint256 minReceiveBalance = sellBalance.mul(10**tokenList[targetID].decimals).div(10**tokenList[_tokenID].decimals); // Change to match decimals of destination
                    uint256 estimate = simulateExchange(_tokenID, targetID, sellBalance);
                    if(estimate > minReceiveBalance){
                        uint256 _gain = estimate.sub(minReceiveBalance).mul(1e18).div(10**tokenList[targetID].decimals); // Normalized gain
                        _normalizedGain = _normalizedGain.add(_gain);
                    }         
                }
            }                
        }
        
        if(_normalizedGain <= minAmountProfit){
            // Set to 0 if gain is not enough
            _normalizedGain = 0;
        }

        // Calculate how much BNB the executor would make as profit
        uint256 estimate = 0;
        if(_normalizedGain > 0){
            uint256 sellBalance = _normalizedGain.mul(10**tokenList[targetID].decimals).div(1e18); // Convert to target decimals
            sellBalance = sellBalance.mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR);
            // Estimate output
            estimate = simulateExchange(targetID, WBNB_TOKEN_ID, sellBalance);           
        }

        // Factor in the profit from converting Dodo to BNB
        estimate = estimate.add(calculateDodoSwap());

        // Now calculate the amount going to the executor
        uint256 gasFee = gasPrice.mul(_allocatedStipend); // This is gas stipend in wei
        if(gasFee >= estimate.mul(maxPercentStipend).div(DIVISION_FACTOR)){ // Max percent of total
            return (estimate.mul(maxPercentStipend).div(DIVISION_FACTOR), targetID, block.number); // The executor will get max percent of total
        }else{
            estimate = estimate.sub(gasFee); // Subtract fee from remaining balance
            return (estimate.mul(percentExecutor).div(DIVISION_FACTOR).add(gasFee), targetID, block.number); // Executor amount with fee added
        }
        
    }
    
    // Accepts 1) address for where executor profit should go, 2) uint256 minimum seconds required since last trade, 
    // 3) uint256 blocknumber that trade will expire after 4) uint256 tokenID to buy, 5) bool to do a flash loan
    function executorSwapTokens(address _executor, uint256 _minSecSinceLastTrade, uint256 _deadlineBlock, uint256 _buyToken) external {
        // Function designed to promote trading with incentive. Users get percentage of WBNB from profitable trades
        require(block.number <= _deadlineBlock, "Deadline has expired, aborting trade");
        require(now.sub(lastTradeTime) >= _minSecSinceLastTrade, "The last trade was too recent");
        require(_msgSender() == tx.origin, "Contracts cannot interact with this function");
        checkAndSwapToken(_executor, _buyToken);
    }
    
    // Governance functions
    function governanceSwapTokens(uint256 _buyToken) external onlyGovernance {
        // This is function that force trade tokens at anytime. It can only be called by governance
        checkAndSwapToken(_msgSender(), _buyToken);
    }
    
    // Change the trading conditions used by the strategy without timelock
    // --------------------
    function changeTradingConditions(uint256 _pTradeTrigger, 
                                    uint256 _pSellPercent, 
                                    uint256 _maxSell,
                                    uint256 _gasPrice,
                                    uint256 _pStipend,
                                    uint256 _maxStipend,
                                    uint256 _minProfit,
                                    uint256 _minSplit,
                                    uint256 _minReserve,
                                    uint256 _maxLiquid) external onlyGovernance {
        // Changes a lot of trading parameters in one call
        require(_pTradeTrigger <= 100000 && _pSellPercent <= 100000 && _pStipend <= 100000 && _minReserve <= 100000 && _maxLiquid <= 100000,"Percent cannot be greater than 100%");
        percentTradeTrigger = _pTradeTrigger;
        maxPercentSell = _pSellPercent;
        maxAmountSell = _maxSell;
        maxPercentStipend = _pStipend;
        gasStipend = _maxStipend;
        minAmountProfit = _minProfit;
        gasPrice = _gasPrice;
        minTradeSplit = _minSplit;
        minReservePercent = _minReserve;
        maxLiquidityPercent = _maxLiquid;
    }
    // --------------------

    // This function is used in case tokens get stuck in strategy, it is used for experimental strategies to prevent any-cause loss of funds
    function governanceEmergencyWithdrawToken(address _token, uint256 _amount) external onlyGovernance {
        require(emergencyWithdrawMode == true, "Cannot withdraw in normal mode");
        IERC20(_token).safeTransfer(governance(), _amount);
    }
    
    // Timelock variables
    
    uint256 private _timelockStart; // The start of the timelock to change governance variables
    uint256 private _timelockType; // The function that needs to be changed
    uint256 constant TIMELOCK_DURATION = 86400; // Timelock is 24 hours
    
    // Reusable timelock variables
    address private _timelock_address;
    uint256[4] private _timelock_data;
    
    modifier timelockConditionsMet(uint256 _type) {
        require(_timelockType == _type, "Timelock not acquired for this function");
        _timelockType = 0; // Reset the type once the timelock is used
        if(balance() > 0){ // Timelock only applies when balance exists
            require(now >= _timelockStart + TIMELOCK_DURATION, "Timelock time not met");
        }
        _;
    }
    
    // Change the owner of the token contract
    // --------------------
    function startGovernanceChange(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 1;
        _timelock_address = _address;       
    }
    
    function finishGovernanceChange() external onlyGovernance timelockConditionsMet(1) {
        transferGovernance(_timelock_address);
    }
    // --------------------
    
    // Change the treasury address
    // --------------------
    function startChangeTreasury(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 2;
        _timelock_address = _address;
    }
    
    function finishChangeTreasury() external onlyGovernance timelockConditionsMet(2) {
        treasuryAddress = _timelock_address;
    }
    // --------------------
    
    // Change the zsbToken address
    // --------------------
    function startChangeZSBToken(address _address) external onlyGovernance {
        _timelockStart = now;
        _timelockType = 3;
        _timelock_address = _address;
    }
    
    function finishChangeZSBToken() external onlyGovernance timelockConditionsMet(3) {
        zsbTokenAddress = _timelock_address;
    }
    // --------------------
    
    // Change the strategy allocations between the parties
    // --------------------
    
    function startChangeStrategyAllocations(uint256 _pDepositors, uint256 _pSDepositors, uint256 _pStakers, uint256 _pExecutor) external onlyGovernance {
        // Changes strategy allocations in one call
        require(_pDepositors <= 100000 && _pExecutor <= 100000 && _pStakers <= 100000 && _pSDepositors <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 4;
        _timelock_data[0] = _pDepositors;
        _timelock_data[1] = _pExecutor;
        _timelock_data[2] = _pStakers;
        _timelock_data[3] = _pSDepositors;
    }
    
    function finishChangeStrategyAllocations() external onlyGovernance timelockConditionsMet(4) {
        percentDepositor = _timelock_data[0];
        percentExecutor = _timelock_data[1];
        percentStakers = _timelock_data[2];
        percentStakeDepositor = _timelock_data[3];
    }
    // --------------------
    
    // Going into emergency withdraw mode
    // --------------------
    function startActivateEmergencyWithdrawMode() external onlyGovernance {
        _timelockStart = now;
        _timelockType = 5;
    }
    
    function finishActivateEmergencyWithdrawMode() external onlyGovernance timelockConditionsMet(5) {
        emergencyWithdrawMode = true;
    }
    // --------------------
    
}
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

// File: contracts/strategies/StandardStrategyWombexFarmV2.sol

pragma solidity =0.6.6;
pragma experimental ABIEncoderV2;

interface StabilizeStakingPool {
    function notifyRewardAmount(uint256) external;
    function getTotalSTBB() external view returns (uint256);
    function getCurrentStrategy() external view returns (address);
}

interface PancakeRouter {
    function swapExactETHForTokens(uint, address[] calldata, address, uint) external payable returns (uint[] memory);
    function swapExactTokensForTokens(uint, uint, address[] calldata, address, uint) external returns (uint[] memory);
    function getAmountsOut(uint, address[] calldata) external view returns (uint[] memory); // For a value in, it calculates value out
}

interface UniswapV3RouterQuoter{
    struct ExactInputSingleParams {
        address tokenIn;
        address tokenOut;
        uint24 fee;
        address recipient;
        uint256 amountIn;
        uint256 amountOutMinimum;
        uint160 sqrtPriceLimitX96;
    }
    struct QuoteExactInputSingleParams {
        address tokenIn;
        address tokenOut;
        uint256 amountIn;
        uint24 fee;
        uint160 sqrtPriceLimitX96;
    }
    function exactInputSingle(UniswapV3RouterQuoter.ExactInputSingleParams calldata params) external returns (uint256 amountOut);
    function quoteExactInputSingle(UniswapV3RouterQuoter.QuoteExactInputSingleParams calldata params) 
        external 
        returns (
            uint256 amountOut,
            uint160 sqrtPriceX96After,
            uint32 initializedTicksCrossed,
            uint256 gasEstimate);
}

interface ValueLikeExchange{
    function calculateSwap(uint8, uint8, uint256) external view returns (uint256);
    function swap(uint8 tokenIndexFrom, uint8 tokenIndexTo, uint256 dx, uint256 minDy, uint256 deadline) external returns (uint256);
}

interface WombexDepositor{
    function deposit(address _womLpToken, uint256 _amount, uint256 _minLiquidity, uint256 _deadline, bool _stake) external;
    function withdraw(address _womLpToken, uint256 _amount, uint256 _minOut, uint256 _deadline, address _recipient) external;
    function getWithdrawAmountOut(address _lptoken, address _tokenOut, uint256 _amount) external view returns (uint256 amount, uint256 fee);
}

interface WombexRewarderVault{
    function getReward(address _account, bool _lockCvx) external returns(bool);
    function balanceOf(address account) external view returns (uint256);
    function earned(address _token, address _account) external view returns (uint256);
    function operator() external view returns (address);
    function pid() external view returns (uint256);
    function tokenRewards(address _token) external view returns (
        address token,
        uint256 periodFinish,
        uint256 rewardRate,
        uint256 lastUpdateTime,
        uint256 rewardPerTokenStored,
        uint256 queuedRewards,
        uint256 currentRewards,
        uint256 historicalRewards,
        bool paused);
    function totalSupply() external view returns (uint256);
}

interface WombexBooster{
    function DENOMINATOR() external view returns (uint256);
    function mintRatio() external view returns (uint256);
    function penaltyShare() external view returns (uint256);
    function customMintRatio(uint256) external view returns (uint256);
    function customPenaltyShare(uint256) external view returns (uint256);
}

// This will swap between Wombex markets that have the highest return APR, there is a limit to the frequency that this action can be performed

contract StandardStrategyWombexFarmV2 is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;
    
    address public treasuryAddress; // Address of the treasury
    address public zsbTokenAddress; // The address of the controlling zsb-Token

    uint256 constant DIVISION_FACTOR = 100000;

    uint256 public lastTradeTime;
    uint256 public lastSwapTime;
    uint256 public lastActionBalance; // Balance before last deposit, withdraw or trade
    uint256 public maxAmountSell = 500000; // The maximum amount of tokens that can be sold at once
    uint256 public percentDepositor = 90000; // 1000 = 1%, depositors earn 90% of all gains
    uint256 public percentExecutor = 10000; // 10000 = 10% of WBNB goes to executor
    uint256 public percentStakers = 50000; // 50000 = 50% of WBNB goes to strat stakers
    uint256 public maxSlippage = 1000;
    uint256 public minSwapInterval = 1 days; // The minimum time required between swapping pools
    uint256 public bestAPRPool; // Will either be 2 or 3

    // Token information
    // This strategy accepts multiple stablecoins
    // BUSD, DAI, USDC, USDT
    // But only two are used, USDC & USDT
    struct TokenInfo {
        IERC20 token; // Reference of token
        uint256 decimals; // Decimals of token
        uint8 synapseID;
        address wombatLP;
        address wombexRewarderVault;
    }
    
    TokenInfo[] private tokenList; // An array of tokens accepted as deposits
    
    
    address constant WBNB_ADDRESS = address(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c); // WBNB address
    address constant WOM_ADDRESS = address(0xAD6742A35fB341A9Cc6ad674738Dd8da98b94Fb1); // WOM address
    address constant WMX_ADDRESS = address(0xa75d9ca2a0a1D547409D82e1B06618EC284A2CeD); // WMX address

    // Exchanges
    address constant PANCAKE_V2_ROUTER = address(0x10ED43C718714eb63d5aA57B78B54704E256024E);
    address constant PANCAKE_V3_ROUTER = address(0x13f4EA83D0bd40E75C8222255bc855a974568Dd4);
    address constant PANCAKE_V3_QUOTER = address(0x4c650FB471fe4e0f476fD3437C3411B1122c4e3B);
    address constant WOMBEX_DEPOSITOR = address(0xc2Ee2ab275BC3F38cA30E902211640D8bB58C4d1);
    address constant SYNAPSE_EXCHANGE = address(0x28ec0B36F0819ecB5005cAB836F4ED5a2eCa4D13);
    uint24 constant PANCAKEV3_FEE_HIGH_PERCENT = 10000; // 1% fee group
    
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
        // Start with BUSD
        IERC20 _token = IERC20(address(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                synapseID: 1,
                wombatLP: address(0),
                wombexRewarderVault: address(0)
            })
        );   
        
        // DAI
        _token = IERC20(address(0x1AF3F329e8BE154074D8769D1FFa4eE058B1DBc3));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                synapseID: 0,
                wombatLP: address(0),
                wombexRewarderVault: address(0)
            })
        );
        
        // USDC
        _token = IERC20(address(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                synapseID: 2,
                wombatLP: 0x681124f5BDD9aCDA19d1721063254189903CD685,
                wombexRewarderVault: 0xCc3796A74a08Bf30BE33ac8D6d433f42231b5F15
            })
        );
        
        // USDT
        _token = IERC20(address(0x55d398326f99059fF775485246999027B3197955));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals(),
                synapseID: 3,
                wombatLP: 0x184EB7DDE8c00fad900120235b534AABc1d96F75,
                wombexRewarderVault: 0x11c8C9E576287d3e12f3B53FE58840Ef5B34F508
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
        return getNormalizedTotalBalance();
    }
    
    function getNormalizedTotalBalance() public view returns (uint256) {
        // Get the balance of the tokens at this address
        uint256 _balance = 0;
        uint256 _length = tokenList.length;
        for(uint256 i = 0; i < _length; i++){
            uint256 _bal = getTokenBalanceWithStake(i);
            _bal = _bal.mul(1e18).div(10**tokenList[i].decimals);
            _balance = _balance.add(_bal); // This has been normalized to 1e18 decimals
        }
        return _balance;
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
        // This function will return the address and amount of the token with the highest balance
        uint256 length = tokenList.length;
        uint256 targetID = 0;
        uint256 targetNormBalance = 0;
        for(uint256 i = 0; i < length; i++){
            uint256 _normBal = getTokenBalanceWithStake(i).mul(1e18).div(10**tokenList[i].decimals);
            if(_normBal > 0){
                if(targetNormBalance == 0 || _normBal >= targetNormBalance){
                    targetNormBalance = _normBal;
                    targetID = i;
                }
            }
        }
        if(targetNormBalance > 0){
            return (targetID, getTokenBalanceWithStake(targetID));
        }else{
            return (0, 0); // No balance
        }        
    }

    function getTokenBalanceWithStake(uint256 _tokID) internal view returns (uint256) {
        uint256 _bal = tokenList[_tokID].token.balanceOf(address(this));
        if(_tokID >= 2){
            // DAI & BUSD cannot be staked
            WombexRewarderVault vault = WombexRewarderVault(tokenList[_tokID].wombexRewarderVault);
            uint256 _internal = vault.balanceOf(address(this));
            if(_internal > 0){
                WombexDepositor router = WombexDepositor(WOMBEX_DEPOSITOR);
                (_internal, ) = router.getWithdrawAmountOut(tokenList[_tokID].wombatLP, address(tokenList[_tokID].token), _internal);
                _bal = _bal.add(_internal);
            }
        }
        return _bal;
    }
    
    // Write functions
    
    function enter() external onlyZSBToken {
        checkBestPerformer();
        deposit(false);
    }
    
    function exit() external onlyZSBToken {
        // The ZS token vault is removing all tokens from this strategy
        withdraw(_msgSender(),1,1, false);
    }
    
    function deposit(bool nonContract) public onlyZSBToken {
        // Only the ZS token can call the function
        
        // No trading is performed on deposit
        if(nonContract == true){
            // Autostake into pool
            addToLiquidityPoolAndStake();
        }
        lastActionBalance = balance(); // This action balance represents pool post stablecoin deposit
    }
    
    function withdraw(address _depositor, uint256 _share, uint256 _total, bool nonContract) public onlyZSBToken returns (uint256) {
        require(balance() > 0, "There are no tokens in this strategy");

        unstakeAndRemoveFromLiquidityPool();
        
        uint256 withdrawAmount = 0;
        uint256 _balance = balance();
        if(_share < _total){
            uint256 _myBalance = _balance.mul(_share).div(_total);
            withdrawPerBalance(_depositor, _myBalance, false); // This will withdraw based on token balance
            withdrawAmount = _myBalance;
            if(nonContract == true){
                addToLiquidityPoolAndStake();
            }
        }else{
            // We are all shares, transfer all, no need to restake
            withdrawPerBalance(_depositor, _balance, true);
            withdrawAmount = _balance;
        }       
        lastActionBalance = balance();
        
        return withdrawAmount;
    }
    
    // This will withdraw the tokens from the contract based on their balance, from highest balance to lowest
    // Tokens will be unstaked at this point
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
        PancakeRouter router = PancakeRouter(PANCAKE_V2_ROUTER);
        path = new address[](2);
        path[0] = WBNB_ADDRESS;
        path[1] = address(tokenList[0].token); // First get BUSD
        uint256 _amount = tokenList[0].token.balanceOf(address(this));
        router.swapExactETHForTokens{value: msg.value}(1, path, address(this), now.add(60));
        _amount = tokenList[0].token.balanceOf(address(this)).sub(_amount);
        if(_tokenID != 0){
            exchangeStables(0, _tokenID, _amount); // Convert to other token       
        }
    }
    */

    // Current exchangess
    // 0 - Synapse - BUSD/USDT/USDC
    
    function exchangeStables(uint256 _idIn, uint256 _idOut, uint256 _amount) internal {
        if(_idOut == 1 || _idIn == 1){return;} // Disable trading into and out from DAI completely
        ValueLikeExchange exchange = ValueLikeExchange(SYNAPSE_EXCHANGE);
        tokenList[_idIn].token.safeApprove(address(exchange), 0);
        tokenList[_idIn].token.safeApprove(address(exchange), _amount);
        uint256 minIn = _amount.mul(10 ** tokenList[_idOut].decimals).div(10 ** tokenList[_idIn].decimals);
        minIn = minIn.mul(DIVISION_FACTOR.sub(maxSlippage)).div(DIVISION_FACTOR);
        exchange.swap(tokenList[_idIn].synapseID, tokenList[_idOut].synapseID, _amount, minIn, now.add(60));
        return;
    }

    function addToLiquidityPoolAndStake() internal {
        for(uint256 i = 0; i < tokenList.length; i++){
            if(i == 1){continue;} // Can't swap DAI
            if(i != bestAPRPool && bestAPRPool > 0){
                // Convert tokens to best performer
                uint256 _amount = tokenList[i].token.balanceOf(address(this));
                if(_amount > maxAmountSell.mul(10 ** tokenList[i].decimals)){
                    _amount = maxAmountSell.mul(10 ** tokenList[i].decimals);
                }
                if(_amount == 0){continue;}
                exchangeStables(i, bestAPRPool, _amount);
            }
        }
        // Then stake the others
        for(uint256 i = 0; i < tokenList.length; i++){
            if(i < 2){continue;}
            WombexDepositor router = WombexDepositor(WOMBEX_DEPOSITOR);
            uint256 _amount = tokenList[i].token.balanceOf(address(this));
            if(_amount == 0){continue;}
            tokenList[i].token.safeApprove(address(router), 0);
            tokenList[i].token.safeApprove(address(router), _amount);
            router.deposit(tokenList[i].wombatLP, _amount, 1, block.timestamp.add(60), true);
        }
    }

    function unstakeAndRemoveFromLiquidityPool() internal {
        for(uint256 i = 0; i < tokenList.length; i++){
            if(i < 2) { continue; }
            WombexRewarderVault vault = WombexRewarderVault(tokenList[i].wombexRewarderVault);
            uint256 _internal = vault.balanceOf(address(this));
            if(_internal > 0){
                WombexDepositor router = WombexDepositor(WOMBEX_DEPOSITOR);
                IERC20(tokenList[i].wombexRewarderVault).safeApprove(address(router), 0);
                IERC20(tokenList[i].wombexRewarderVault).safeApprove(address(router), _internal);
                router.withdraw(tokenList[i].wombatLP, _internal, 1, block.timestamp.add(60), address(this));
            }
        }
    }

    function checkBestPerformer() internal {
        if(block.timestamp.sub(lastSwapTime) < minSwapInterval) { return; } // Wait at least this long
        // This will check the pool that has the best performance and unstake if necessary
        uint256 bestPool;
        uint256 bestPoolRate;

        for(uint256 i = 0; i < tokenList.length; i++){
            if(i < 2) { continue; }
            WombexRewarderVault vault = WombexRewarderVault(tokenList[i].wombexRewarderVault);
            (,,uint256 totalRewardRate,,,,,,) = vault.tokenRewards(WOM_ADDRESS);
            uint256 vaultTotal = vault.totalSupply();
            if(vaultTotal == 0){continue;}
            uint256 poolRate = totalRewardRate * 1e18 / vaultTotal;
            if(poolRate > bestPoolRate){
                bestPool = i;
                bestPoolRate = poolRate;
            }
        }

        if(bestPool != bestAPRPool){
            unstakeAndRemoveFromLiquidityPool(); // Remove all liquidity
            bestAPRPool = bestPool;
            lastSwapTime = block.timestamp;
        }
    }

    function handleWombexRewards() internal {
        for(uint256 i = 0; i < tokenList.length; i++){
            if(i < 2) { continue; }
            WombexRewarderVault vault = WombexRewarderVault(tokenList[i].wombexRewarderVault);
            vault.getReward(address(this), false); // Will pull both WOM and WMX
        }

        uint256 _usdtBal = tokenList[3].token.balanceOf(address(this));

        // Convert WOM to USDT
        uint256 _bal = IERC20(WOM_ADDRESS).balanceOf(address(this));
        if(_bal > 0){
            swapViaPancakeV3(WOM_ADDRESS, address(tokenList[3].token), _bal, PANCAKEV3_FEE_HIGH_PERCENT);
        }

        // Convert WMX to USDT
        _bal = IERC20(WMX_ADDRESS).balanceOf(address(this));
        if(_bal > 0){
            swapViaPancakeV3(WMX_ADDRESS, address(tokenList[3].token), _bal, PANCAKEV3_FEE_HIGH_PERCENT);
        }

        _usdtBal = tokenList[3].token.balanceOf(address(this)).sub(_usdtBal);
        if(_usdtBal > 0){
            // Convert some of this into WBNB from USDT
            uint256 _send = _usdtBal.mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR); // Amount going to pool holders
            address[] memory path = new address[](2);
            path[0] = address(tokenList[3].token);
            path[1] = WBNB_ADDRESS;
            PancakeRouter router = PancakeRouter(PANCAKE_V2_ROUTER);
            IERC20(path[0]).safeApprove(address(router), 0);
            IERC20(path[0]).safeApprove(address(router), _send);
            router.swapExactTokensForTokens(_send, 1, path, address(this), now.add(60)); // Get WBNB from USDT
        }
    }

    function calculateWombexRewards() internal returns (uint256) {
        uint256 _womRewards = 0;
        uint256 _wmxRewards = 0;
        for(uint256 i = 0; i < tokenList.length; i++){
            if(i < 2) { continue; }
            WombexRewarderVault vault = WombexRewarderVault(tokenList[i].wombexRewarderVault);
            uint256 _womReward = vault.earned(WOM_ADDRESS, address(this));
            if(_womReward == 0) { continue; }
            _womRewards = _womRewards.add(_womReward);

            // WMX is calculated from WOM reward
            WombexBooster boost = WombexBooster(vault.operator());
            uint256 pid = vault.pid();
            uint256 _wmxReward = _womReward;
            {
                uint256 poolMintRatio = boost.customMintRatio(pid);
                if(poolMintRatio == 0){
                    poolMintRatio = boost.mintRatio();
                }
                if(poolMintRatio > 0){
                    _wmxReward = _wmxReward.mul(poolMintRatio).div(boost.DENOMINATOR());
                }
            }
            {
                uint256 poolPenaltyShare = boost.customPenaltyShare(pid);
                if(poolPenaltyShare == 0){
                    poolPenaltyShare = boost.penaltyShare();
                }else if(poolPenaltyShare == 1){
                    poolPenaltyShare = 0;
                }
                if(poolPenaltyShare > 0){
                    uint256 penalty = _wmxReward.mul(poolPenaltyShare).div(boost.DENOMINATOR());
                    _wmxReward = _wmxReward.sub(penalty);
                }
            }
            _wmxRewards = _wmxRewards.add(_wmxReward);
        }

        if(_womRewards == 0) { return 0; } // No rewards

        uint256 usdtAmount = calculatePancakeV3Return(WOM_ADDRESS, address(tokenList[3].token), _womRewards, PANCAKEV3_FEE_HIGH_PERCENT);
        usdtAmount = usdtAmount.add(calculatePancakeV3Return(WMX_ADDRESS, address(tokenList[3].token), _wmxRewards, PANCAKEV3_FEE_HIGH_PERCENT));
        
        // Convert to WBNB for rest of pool
        usdtAmount = usdtAmount.mul(DIVISION_FACTOR.sub(percentDepositor)).div(DIVISION_FACTOR);
        PancakeRouter router = PancakeRouter(PANCAKE_V2_ROUTER);
        address[] memory path;
        path = new address[](2);
        path[0] = address(tokenList[3].token);
        path[1] = WBNB_ADDRESS;
        uint256[] memory estimates = router.getAmountsOut(usdtAmount, path);
        uint256 _amount = estimates[estimates.length - 1]; // This is the amount of WBNB returned
        _amount = _amount.add(IERC20(WBNB_ADDRESS).balanceOf(address(this))); // Add any additional balance sitting here
        return _amount; // This is the amount of WBNB returned
    }

    // Uniswap Utils
    function calculatePancakeV3Return(address inputAddress, address outputAddress, uint256 _amount, uint24 _fee) internal returns (uint256) {
        UniswapV3RouterQuoter quoter = UniswapV3RouterQuoter(PANCAKE_V3_QUOTER);
        UniswapV3RouterQuoter.QuoteExactInputSingleParams memory params = UniswapV3RouterQuoter.QuoteExactInputSingleParams(
            inputAddress,
            outputAddress,
            _amount,
            _fee,
            0
        );
        (_amount, , ,) = quoter.quoteExactInputSingle(params);
        return _amount;
    }
    
    function swapViaPancakeV3(address inputAddress, address outputAddress, uint256 _amount, uint24 _fee) internal returns (uint256) {
        uint160 sqrtPriceLimitX96 = 0;
        UniswapV3RouterQuoter router = UniswapV3RouterQuoter(PANCAKE_V3_ROUTER);
        UniswapV3RouterQuoter.ExactInputSingleParams memory params = UniswapV3RouterQuoter.ExactInputSingleParams(
            inputAddress,
            outputAddress,
            _fee,
            address(this),
            _amount,
            1,
            sqrtPriceLimitX96
        );
        uint256 _bal = IERC20(outputAddress).balanceOf(address(this));
        IERC20(inputAddress).safeApprove(address(router), 0);
        IERC20(inputAddress).safeApprove(address(router), _amount);
        router.exactInputSingle(params);
        _bal = IERC20(outputAddress).balanceOf(address(this)).sub(_bal);
        return _bal;
    }
    
    function checkAndSwapToken(address _executor) internal {
        lastTradeTime = now;

        checkBestPerformer(); // It may unstake if necessary
        handleWombexRewards(); // Will increase both USDT and WBNB

        // Now restake
        addToLiquidityPoolAndStake();
        
        // Now take some gain bnb and distribute it to executor, stakers and treasury
        IERC20 bnb = IERC20(WBNB_ADDRESS);
        uint256 bnbBalance = bnb.balanceOf(address(this));
        if(bnbBalance > 0){
            // This is pure profit, figure out allocation
            // Split the amount sent to the treasury, stakers and executor if one exists
            if(_executor != address(0)){
                uint256 executorAmount = bnbBalance.mul(percentExecutor).div(DIVISION_FACTOR);
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
    
    // Accepts 1) address for the executor, 2) random seed number

    // Returns 1) uint256 profit as wei units BNB or wei units total
    // Returns 2) uint256 blocknumber of data returned
    // Returns 3) bytes32 code for seed
    function expectedProfit(address _executor, uint256 seed) external returns (uint256,uint256,bytes32) {
        bytes32 executorCode = generateExecutorCode(_executor, seed);
        
        uint256 estimate = calculateWombexRewards();
        return (estimate.mul(percentExecutor).div(DIVISION_FACTOR), block.number, executorCode);
    }

    // Frontrun deterrants
    function generateExecutorCode(address _executor, uint256 seed) internal pure returns (bytes32) {
        bytes memory data = abi.encode(_executor, seed);
        return keccak256(data);
    }

    function checkExecutorCode(address _executor, uint256 seed, bytes32 code) internal pure {
        bytes32 genCode = generateExecutorCode(_executor, seed);
        require(genCode == code, "Executor code is invalid");
    }
    
    // Accepts 1) address that profit will go to, 2) random seed, used with expectedprofit, 3) random code 4) uint256 minimum amount of seconds required between this swap and last
    // 5) uint256 blocknumber that trade will expire after
    function executorSwapTokens(address _executor, uint256 _seed, bytes32 code, uint256 _minSecSinceLastTrade, uint256 _deadlineBlock) external {
        checkExecutorCode(_executor, _seed, code);
        require(block.number <= _deadlineBlock, "Deadline has expired, aborting trade");
        // Function designed to promote trading with incentive. Users get percentage of WBNB from profitable trades
        require(now.sub(lastTradeTime) >= _minSecSinceLastTrade, "The last trade was too recent");
        require(_msgSender() == tx.origin, "Contracts cannot interact with this function");
        checkAndSwapToken(_executor);
    }
    
    // Governance functions
    function governanceSwapTokens() external onlyGovernance {
        // This is function that force trade tokens at anytime. It can only be called by governance
        checkAndSwapToken(_msgSender());
    }
    
    // Change the trading conditions used by the strategy without timelock
    // --------------------
    function changeTradingConditions(uint256 _maxSlippage, 
                                    uint256 _maxSell,
                                    uint256 _minInterval) external onlyGovernance {
        maxAmountSell = _maxSell;
        maxSlippage = _maxSlippage;
        minSwapInterval = _minInterval;
    }
    // --------------------
    
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
    
    function startChangeStrategyAllocations(uint256 _pDepositors, uint256 _pStakers, uint256 _pExecutor) external onlyGovernance {
        // Changes strategy allocations in one call
        require(_pDepositors <= 100000 && _pExecutor <= 100000 && _pStakers <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 4;
        _timelock_data[0] = _pDepositors;
        _timelock_data[1] = _pExecutor;
        _timelock_data[2] = _pStakers;
    }
    
    function finishChangeStrategyAllocations() external onlyGovernance timelockConditionsMet(4) {
        percentDepositor = _timelock_data[0];
        percentExecutor = _timelock_data[1];
        percentStakers = _timelock_data[2];
    }
    // --------------------
}
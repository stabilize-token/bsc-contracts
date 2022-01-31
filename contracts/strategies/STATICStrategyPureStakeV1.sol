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

// File: contracts/strategies/STATICStrategyPureStakeV1.sol

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
    function addLiquidity(address tokenA, address tokenB, uint amountADesired, uint amountBDesired, uint amountAMin, uint amountBMin, address to, uint deadline) external returns (uint amountA, uint amountB, uint liquidity);
    function removeLiquidity(address tokenA, address tokenB, uint liquidity, uint amountAMin, uint amountBMin, address to, uint deadline) external returns (uint amountA, uint amountB);
}

interface SushiswapLikeLPToken {
    function sync() external; // We need to call sync before Trading on Pancakeswap due to rebase potential
}

interface MasterChefLikePool{
    function userInfo(uint256 _pid, address _address) external view returns (uint256, uint256);
    function pendingReward(address _user, uint256 _pid) external view returns (uint256);
    function deposit(uint256 _amount, uint256 _pid) external;
    function withdraw(uint256 _amount, uint256 _pid) external; // This collects any reward token
    function emergencyWithdraw(uint256 _pid) external;
}

interface StaticTreasury{
    function dollarOracle() external view returns (address);
}

interface PriceOracle{
    function twap(address _token, uint256 _amountIn) external view returns (uint256); // Gets TWAP price
}

// This strategy will supply liquidity to STATIC/BUSD pool when STATIC TWAP is greater than $1.01 but will sell STATIC for BUSD when STATIC TWAP is less than $1
// Or spot price is less than $0.95 cents AND TWAP is less than $1.01

// It will buy STATIC (with half BUSD) when TWAP is greater than $1.01 AND spot price is less than $1.05 and greater than $1

// It will sell STATIC also if there is more STATIC than BUSD in the contract (based on the value difference) to try to balance out the ratio to 50% (in price)
// 10% of farming profit will go to executor and STBB stakers/treasury

contract STATICStrategyPureStakeV1 is Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address;
    
    address public treasuryAddress; // Address of the treasury
    address public zsbTokenAddress; // The address of the controlling zsb-Token

    uint256 constant DIVISION_FACTOR = 100000;
    
    uint256 public gasPrice = 10e9; // Gas price in wei, not constant
    uint256 public lastTradeTime;
    uint256 public lastActionBalance; // Balance before last deposit, withdraw or trade
    uint256 public percentStakeDepositor = 90000; // depositors earn 90% of all stake gains
    uint256 public percentExecutor = 10000; // 10000 = 10% of WBNB goes to executor on top of gas stipend
    uint256 public percentStakers = 50000; // 50000 = 50% of WBNB goes to strat stakers
    uint256 public percentTradeTrigger = 20000;
    uint256 public maxPercentStipend = 50000; // The maximum amount of WBNB profit that can be allocated to the executor for gas in percent
    uint256 public gasStipend = 1800000; // This is the gas units that are covered by executing a trade taken from the WBNB profit    
    uint256 public swapGasStipend = 1500000; // Executor will get paid a set amount of fees to cover gas cost for liquidation and buy events

    // Price thresholds
    uint256 public minSupplyPrice = 1010000000000000000;
    uint256 public maxSpotBuyPrice = 1050000000000000000;
    uint256 public minSellPrice = 1000000000000000000;
    uint256 public spotSellPrice = 950000000000000000;
    uint256 public allowedPriceSlippage = 8000;
    bool public checkPriceSlippage = true;

    bool public emergencyWithdrawMode = false; // Activated in case tokens get stuck in strategy after timelock

    // Token information
    // STATIC, BUSD
    struct TokenInfo {
        IERC20 token; // Reference of token
        uint256 decimals; // Decimals of token
    }
    
    TokenInfo[] private tokenList; // An array of tokens accepted as deposits
    
    // Strategy specific variables
    address constant WBNB_ADDRESS = address(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c); // WBNB address
    address constant CHARGE_ADDRESS = address(0x1C6bc8e962427dEb4106aE06A7fA2d715687395c); // Charge address
    uint256 constant WBNB_TOKEN_ID = 2;
    uint256 constant PANCAKE_FEE = 250; // Fee to swap on pancake
    
    address constant PANCAKE_ROUTER = address(0x10ED43C718714eb63d5aA57B78B54704E256024E); // Router v2
    address constant STATIC_BUSD_LP_TOKEN = address(0x69758726b04e527238B261ab00236AFE9F34929D);
    address constant STATIC_BUSD_STAKING_POOL = address(0xA48B61392B240E122d00Fe334EF995a9A23deCFF);
    address constant STATIC_TREASURY = address(0x55E47AdF85Ac0571e6091CC1dE8a86D6ADc13d56);

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
        // Start with STATIC
        IERC20 _token = IERC20(address(0x7dEb9906BD1d77B410a56E5C23c36340Bd60C983));
        tokenList.push(
            TokenInfo({
                token: _token,
                decimals: _token.decimals()
            })
        );
        
        // BUSD
        _token = IERC20(address(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56));
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
        // Get static at address and busd in static units based on price oracle
        uint256 _balance = 0;
        for(uint256 i = 0; i < tokenList.length; i++){
            uint256 _bal = tokenList[i].token.balanceOf(_address);
            _bal = _bal.add(getTokenInLPShare(address(tokenList[i].token), _address)); // Add the amount of token in LP position
            if(i > 0){
                _bal = busdInSTATICUnits(_bal); // Convert to static units
            }
            _bal = _bal.mul(1e18).div(10**tokenList[0].decimals);
            _balance = _balance.add(_bal); // This has been normalized to 1e18 decimals
        }
        return _balance;
    }

    function getTokenInLPShare(address _token, address _address) public view returns (uint256) {
        IERC20 token = IERC20(_token);
        IERC20 lpToken = IERC20(STATIC_BUSD_LP_TOKEN);
        uint256 tokenTotal = token.balanceOf(STATIC_BUSD_LP_TOKEN); // Total amount of tokens in the LP pool
        uint256 lpBalance = lpToken.balanceOf(address(_address));
        MasterChefLikePool pool = MasterChefLikePool(STATIC_BUSD_STAKING_POOL);
        (uint256 _bal, ) = pool.userInfo(0, address(this));
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
        // This function will return the address and amount of main, then collateral
        uint256 tokenBalance1 = tokenList[0].token.balanceOf(address(this));
        tokenBalance1 = tokenBalance1.add(getTokenInLPShare(address(tokenList[0].token), address(this)));
        uint256 tokenBalance2 = tokenList[1].token.balanceOf(address(this));
        tokenBalance2 = tokenBalance2.add(getTokenInLPShare(address(tokenList[1].token), address(this)));
        if(tokenBalance1 > 0){
            return (0, tokenBalance1);
        }else if(tokenBalance2 > 0){
            return (1, tokenBalance2);
        }else{
            return (0, 0); // No balance
        }        
    }

    function busdInSTATICUnits(uint256 _amount) internal view returns (uint256) {
        if(_amount == 0){return 0;}
        uint256 staticPrice = getSTATICTWAPPrice();
        _amount = _amount.mul(10**tokenList[0].decimals).div(10**tokenList[1].decimals); // Convert to static units
        _amount = _amount.mul(1e18).div(staticPrice);
        return _amount;
    }
    
    function staticInBUSDUnits(uint256 _amount) internal view returns (uint256) {
        if(_amount == 0){return 0;}
        uint256 staticPrice = getSTATICTWAPPrice();
        _amount = _amount.mul(10**tokenList[1].decimals).div(10**tokenList[0].decimals); // Convert to static units
        _amount = _amount.mul(staticPrice).div(1e18);
        return _amount;
    }

    function getSTATICTWAPPrice() public view returns (uint256) {
        PriceOracle oracle = PriceOracle(StaticTreasury(STATIC_TREASURY).dollarOracle());
        return oracle.twap(address(tokenList[0].token), uint256(1).mul(10**tokenList[0].decimals)); // Returns normalized price
    }

    function getStaticSpotPrice() public view returns (uint256) {
        return simulateExchange(0, 1, uint256(1).mul(10**tokenList[0].decimals).mul(1e18).div(10**tokenList[1].decimals)); // Returns normalized price
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
        uint256 currentBalance = balance();
        // Only the ZS token can call the function
        
        if(nonContract == true){
            // Adjust the ratios
            if(currentBalance > lastActionBalance){
                uint256 change = currentBalance.sub(lastActionBalance);
                if(change > lastActionBalance.mul(percentTradeTrigger).div(DIVISION_FACTOR)){
                    checkAndSwapToken(address(0));
                }                
            }
        }
        lastActionBalance = currentBalance; // This action balance represents pool post deposit
    }
    
    function withdraw(address _depositor, uint256 _share, uint256 _total, bool nonContract) public onlyZSBToken returns (uint256) {
        require(balance() > 0, "There are no tokens in this strategy");
        if(nonContract == true){
            if( _share > _total.mul(percentTradeTrigger).div(DIVISION_FACTOR)){
                checkAndSwapToken(address(0));
            }
        }
        
        uint256 withdrawAmount = 0;
        uint256 _balance = balance();
        if(_share < _total){
            uint256 _myBalance = _balance.mul(_share).div(_total);

            // Determine if we need to unstake or not. Small amounts do not normally require unstaking
            uint256 inBalance = tokenList[0].token.balanceOf(address(this)).mul(1e18).div(10**tokenList[0].decimals);
            if(inBalance < _myBalance){
                // We need to unstake the tokens
                unstakeAndRemoveFromLiquidityPool();
            }

            withdrawPerOrderWithOracleSwap(_depositor, _myBalance, false); // This will withdraw based on token price
            withdrawAmount = _myBalance;
            if(inBalance < _myBalance){
                // Restake the tokens
                addToLiquidityPoolAndStake();
            }
        }else{
            // We are all shares, transfer all
            unstakeAndRemoveFromLiquidityPool();
            withdrawPerOrderWithOracleSwap(_depositor, _balance, true);
            withdrawAmount = _balance;
        }       
        lastActionBalance = balance();
        
        return withdrawAmount;
    }
    
    // This will withdraw the tokens from the contract based on order, essentially main token then collateral
    function withdrawPerOrderWithOracleSwap(address _receiver, uint256 _withdrawAmount, bool _takeAll) internal {
        uint256 spot = getStaticSpotPrice();
        uint256 twap = getSTATICTWAPPrice();
        if(checkPriceSlippage == true){
            require(spot < twap.mul(allowedPriceSlippage).div(DIVISION_FACTOR).add(twap), "Spot price is much higher than twap");
        }
        uint256 length = tokenList.length;
        if(_takeAll == true){
            // Send the entire balance
            for(uint256 i = 0; i < length; i++){
                uint256 _bal = tokenList[i].token.balanceOf(address(this));
                if(_bal > 0){
                    if(i == 0){
                        tokenList[i].token.safeTransfer(_receiver, _bal);
                    }else{
                        exchange(i, 0, _bal);
                        tokenList[0].token.safeTransfer(_receiver, tokenList[0].token.balanceOf(address(this)));
                    }
                    
                }
            }
            return;
        }

        for(uint256 i = 0; i < length; i++){
            // Determine the balance left
            uint256 _normalizedBalance = tokenList[i].token.balanceOf(address(this));
            if(i == 0){
                _normalizedBalance = _normalizedBalance.mul(1e18).div(10**tokenList[0].decimals); // Convert static to normalized
            }else if(i == 1){
                // USDT
                _normalizedBalance = busdInSTATICUnits(_normalizedBalance); // Convert BUSD to static units
                // Then normalize STATIC units
                _normalizedBalance = _normalizedBalance.mul(1e18).div(10**tokenList[0].decimals);
            }
            if(_normalizedBalance <= _withdrawAmount){
                // Withdraw the entire balance of this token
                if(_normalizedBalance > 0){
                    _withdrawAmount = _withdrawAmount.sub(_normalizedBalance);
                    if(i == 0){
                        tokenList[i].token.safeTransfer(_receiver, tokenList[i].token.balanceOf(address(this)));
                    }else{
                        // Convert whatever is left to STATIC
                        exchange(i, 0, tokenList[i].token.balanceOf(address(this)));
                        tokenList[0].token.safeTransfer(_receiver, tokenList[0].token.balanceOf(address(this)));                  
                    }              
                }
            }else{
                // Withdraw a partial amount of this token
                if(_withdrawAmount > 0){
                    // Convert the withdraw amount to the static decimal amount
                    uint256 _balance = _withdrawAmount.mul(10**tokenList[0].decimals).div(1e18);
                    if(i == 1){
                        // If usdt then convert STATIC units to BUSD
                        _balance = staticInBUSDUnits(_balance);
                    }
                    _withdrawAmount = 0;
                    if(i == 0){
                        tokenList[i].token.safeTransfer(_receiver, _balance);
                    }else{
                        exchange(i, 0, _balance);
                        tokenList[0].token.safeTransfer(_receiver, tokenList[0].token.balanceOf(address(this)));
                    }
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
        path[1] = address(tokenList[1].token); // First get BUSD
        uint256 _amount = tokenList[1].token.balanceOf(address(this));
        router.swapExactETHForTokens{value: msg.value}(1, path, address(this), now.add(60));
        _amount = tokenList[1].token.balanceOf(address(this)).sub(_amount);
        if(_tokenID != 1){
            exchange(1, _tokenID, _amount); // Convert to other token       
        }
    }
    */

    function simulateExchange(uint256 _idIn, uint256 _idOut, uint256 _amount) internal view returns (uint256) {
        address[] memory path;
        uint256[] memory estimates;
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        if(_idOut == WBNB_TOKEN_ID){
            if(_idIn == 1){
                // Already BUSD
                path = new address[](2);
                path[0] = address(tokenList[_idIn].token);
                path[1] = WBNB_ADDRESS;
            }else if(_idIn == 0){
                // STATIC -> BUSD -> WBNB
                path = new address[](3);
                path[0] = address(tokenList[_idIn].token);
                path[1] = address(tokenList[1].token);
                path[2] = WBNB_ADDRESS;                
            }
        }else if(_idIn == 0 || _idIn == 1){
            // Pancakeswap
            path = new address[](2);
            path[0] = address(tokenList[_idIn].token);
            path[1] = address(tokenList[_idOut].token);
        }else if(_idIn == WBNB_TOKEN_ID){
            if(_idOut == 1){
                // To BUSD
                path = new address[](2);
                path[0] = WBNB_ADDRESS;
                path[1] = address(tokenList[_idOut].token);
            }else if(_idOut == 0){
                // WNBNB -> BUSD -> STATIC
                path = new address[](3);
                path[0] = WBNB_ADDRESS;
                path[1] = address(tokenList[1].token);
                path[2] = address(tokenList[0].token);
            }         
        }
        estimates = router.getAmountsOut(_amount, path);
        _amount = estimates[estimates.length - 1]; // This is the amount of WBNB returned
        return _amount;
    }
    
    function exchange(uint256 _idIn, uint256 _idOut, uint256 _amount) internal {
        address[] memory path;
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        tokenList[_idIn].token.safeApprove(address(router), 0);
        tokenList[_idIn].token.safeApprove(address(router), _amount);
        if(_idOut == WBNB_TOKEN_ID){
            if(_idIn == 1){
                // Already BUSD
                path = new address[](2);
                path[0] = address(tokenList[_idIn].token);
                path[1] = WBNB_ADDRESS;
            }else if(_idIn == 0){
                SushiswapLikeLPToken lpToken = SushiswapLikeLPToken(STATIC_BUSD_LP_TOKEN);
                lpToken.sync();
                path = new address[](3);
                path[0] = address(tokenList[_idIn].token);
                path[1] = address(tokenList[1].token);
                path[2] = WBNB_ADDRESS;                
            }
        }else if(_idIn == 0 || _idIn == 1){
            // Pancakeswap
            SushiswapLikeLPToken lpToken = SushiswapLikeLPToken(STATIC_BUSD_LP_TOKEN);
            lpToken.sync();
            path = new address[](2);
            path[0] = address(tokenList[_idIn].token);
            path[1] = address(tokenList[_idOut].token);
        }
        router.swapExactTokensForTokens(_amount, 1, path, address(this), now.add(60)); // Get WBNB from token
        return;
    }

    // This strategy will supply liquidity to STATIC/BUSD pool when STATIC TWAP is greater than $1.01 but will sell STATIC for BUSD when STATIC TWAP is less than $1
    // Or spot price is less than $0.95 cents AND TWAP is less than $1.01

    // It will buy STATIC (with half BUSD) when TWAP is greater than $1.01 AND spot price is less than $1.05 and greater than $1

    // It will sell STATIC also if there is more STATIC than BUSD in the contract (based on the value difference) to try to balance out the ratio to 50% (in price)
    // 10% of farming profit will go to executor and STBB stakers/treasury

    function determineLiquidationOrBuyAction() internal view returns (uint256, uint256) {
        // Returns action and token amount to buy
        uint256 twap = getSTATICTWAPPrice();
        uint256 spot = getStaticSpotPrice();
        uint256 action = 0;

        // Checks amounts in LP too
        uint256 staticAmount = tokenList[0].token.balanceOf(address(this)).add(getTokenInLPShare(address(tokenList[0].token), address(this)));
        uint256 busdAmount = tokenList[1].token.balanceOf(address(this)).add(getTokenInLPShare(address(tokenList[1].token), address(this)));

        uint256 tokenToSell = 0;
        if(spot > 1e18 && spot < maxSpotBuyPrice && twap > minSupplyPrice){
            if(staticAmount == 0 && busdAmount > 1){
                // Buyback STATIC
                action = 1;
            }
        }

        if((spot < spotSellPrice && twap < minSupplyPrice) || twap < 1e18){
            if(staticAmount > 0){
                // Liquidate STATIC
                action = 2;
                if(spot.mul(allowedPriceSlippage).div(DIVISION_FACTOR).add(spot) < twap){
                    action = 0; // Huge split between TWAP and spot price, anomaly
                }
            }
        }

        if(twap > 1e18){
            // Determine if we need to balance out BUSD and STATIC
            uint256 staticValue = staticAmount.mul(1e18).div(10**tokenList[0].decimals).mul(twap); // Normalized value
            uint256 busdValue = busdAmount.mul(1e18).div(10**tokenList[1].decimals).mul(1e18); // Normalized value
            if(staticValue > busdValue.mul(allowedPriceSlippage).div(DIVISION_FACTOR).add(busdValue)){
                // If contract is not balanced, make it balanced
                tokenToSell = staticValue.sub(busdValue);
                tokenToSell = tokenToSell.div(twap).div(2);
                action = 3;
            }
        }
        return (action, tokenToSell);
    }

    function calculateLiquidationOrBuyActionReturn() internal view returns (uint256) {
        // Will determine how much the executor will earn from this action
        uint256 action = 0;
        uint256 tokenToSell = 0;
        uint256 executorShare = 0;
        uint256 staticAmount = tokenList[0].token.balanceOf(address(this)).add(getTokenInLPShare(address(tokenList[0].token), address(this)));
        uint256 busdAmount = tokenList[1].token.balanceOf(address(this)).add(getTokenInLPShare(address(tokenList[1].token), address(this)));

        (action, tokenToSell) = determineLiquidationOrBuyAction();
        if(action == 3 || action == 2){
            // Sell static
            uint256 gasCost = gasPrice.mul(gasStipend);
            executorShare = simulateExchange(WBNB_TOKEN_ID, 0, gasCost); // This is the amount of STATIC we need to give to the executor
            if(executorShare < staticAmount){
                return gasCost.mul(DIVISION_FACTOR.sub(PANCAKE_FEE.mul(2))).div(DIVISION_FACTOR);
            }else{
                return 0;
            }
        }else if(action == 1){
            // Sell BUSD
            uint256 gasCost = gasPrice.mul(gasStipend);
            executorShare = simulateExchange(WBNB_TOKEN_ID, 1, gasCost); // This is the amount of BUSD we need to give to the executor
            if(executorShare < busdAmount){
                return gasCost.mul(DIVISION_FACTOR.sub(PANCAKE_FEE)).div(DIVISION_FACTOR);
            }else{
                return 0;
            }           
        }
    }

    function performLiquidationOrBuyAction(address _executor) internal {
        // This function will determine the state of the STATIC and perform actions based on that state
        // At this point STATIC and BUSD will both be outside the LP

        uint256 action = 0;
        uint256 tokenToSell = 0;
        uint256 executorShare = 0;

        (action, tokenToSell) = determineLiquidationOrBuyAction();

        if(action == 3 || action == 2){
            // We need to sell static, give executor WBNB directly for performing this action
            if(_executor != address(0)){
                uint256 gasCost = gasPrice.mul(gasStipend);
                executorShare = simulateExchange(WBNB_TOKEN_ID, 0, gasCost); // This is the amount of STATIC we need to give to the executor
                if(executorShare < tokenList[0].token.balanceOf(address(this)) && executorShare > 0){
                    // Send some STATIC (as WBNB) to executor before sell for gas fees
                    uint256 _amount = IERC20(WBNB_ADDRESS).balanceOf(address(this));
                    exchange(0, WBNB_TOKEN_ID, executorShare);
                    _amount = IERC20(WBNB_ADDRESS).balanceOf(address(this)).sub(_amount);
                    IERC20(WBNB_ADDRESS).safeTransfer(_executor, _amount);
                }
            }
            if(action == 3){
                // Sell some STATIC for BUSD to balance out pools
                if(tokenToSell < tokenList[0].token.balanceOf(address(this))){
                    // Now sell a certain amount of STATIC tokens for BUSD
                    exchange(0, 1, tokenToSell);
                }
            }else{
                // Sell all STATIC for BUSD
                // Now sell the remaining STATIC tokens for BUSD
                exchange(0, 1, tokenList[0].token.balanceOf(address(this)));
            }
        }else if(action == 1){
            // Buy STATIC with half BUSD
            // Give executor WBNB directly for performing this action
            if(_executor != address(0)){
                uint256 gasCost = gasPrice.mul(gasStipend);
                executorShare = simulateExchange(WBNB_TOKEN_ID, 1, gasCost); // This is the amount of BUSD we need to give to the executor
                if(executorShare < tokenList[1].token.balanceOf(address(this)) && executorShare > 0){
                    // Send some BUSD (as WBNB) to executor before sell for gas fees
                    uint256 _amount = IERC20(WBNB_ADDRESS).balanceOf(address(this));
                    exchange(1, WBNB_TOKEN_ID, executorShare);
                    _amount = IERC20(WBNB_ADDRESS).balanceOf(address(this)).sub(_amount);
                    IERC20(WBNB_ADDRESS).safeTransfer(_executor, _amount);
                }
            }
            // Now sell about half BUSD for STATIC
            exchange(1, 0, tokenList[1].token.balanceOf(address(this)).div(2).mul(getSTATICTWAPPrice()).div(1e18));
        }
    }

    function addToLiquidityPoolAndStake() internal {
        // This function will try to add all the possible liquidity for staking
        uint256 maxAmount1 = tokenList[0].token.balanceOf(address(this));
        uint256 maxAmount2 = tokenList[1].token.balanceOf(address(this));
        if(maxAmount1 == 0 || maxAmount2 == 0){return;}
        SushiswapLikeLPToken lpSwap = SushiswapLikeLPToken(STATIC_BUSD_LP_TOKEN);
        lpSwap.sync();
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        tokenList[0].token.safeApprove(address(router), 0);
        tokenList[1].token.safeApprove(address(router), 0);
        tokenList[0].token.safeApprove(address(router), maxAmount1);
        tokenList[1].token.safeApprove(address(router), maxAmount2);
        // Add liquidity up to the smaller balance
        router.addLiquidity(address(tokenList[0].token), address(tokenList[1].token), maxAmount1, maxAmount2, 1, 1, address(this), now.add(60));

        // Now we have LP tokens
        MasterChefLikePool pool = MasterChefLikePool(STATIC_BUSD_STAKING_POOL);
        IERC20 lpToken = IERC20(STATIC_BUSD_LP_TOKEN);
        uint256 _bal = lpToken.balanceOf(address(this));
        lpToken.safeApprove(address(pool), 0);
        lpToken.safeApprove(address(pool), _bal);
        pool.deposit(_bal, 0); // This contract only has one STATIC/BUSD pool
    }

    function handleChargeSwap() internal {
        IERC20 charge = IERC20(CHARGE_ADDRESS);
        uint256 _bal = charge.balanceOf(address(this));
        if(_bal == 0){return;}
        address[] memory path;

        // Convert first to BUSD
        path = new address[](2);
        path[0] = address(charge);
        path[1] = address(tokenList[1].token);
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        charge.safeApprove(address(router), 0);
        charge.safeApprove(address(router), _bal);
        uint256 _pre = tokenList[1].token.balanceOf(address(this));
        router.swapExactTokensForTokens(_bal, 1, path, address(this), now.add(60)); // Get BUSD from token
        _bal = tokenList[1].token.balanceOf(address(this)).sub(_pre); // Amount of BUSD gained

        // We will convert some BUSD to WBNB
        _bal = _bal.mul(DIVISION_FACTOR.sub(percentStakeDepositor)).div(DIVISION_FACTOR); // Amount going to stakers
        if(_bal == 0){return;}
        path[0] = address(tokenList[1].token);
        path[1] = WBNB_ADDRESS;
        tokenList[1].token.safeApprove(address(router), 0);
        tokenList[1].token.safeApprove(address(router), _bal);
        router.swapExactTokensForTokens(_bal, 1, path, address(this), now.add(60)); // Get WBNB from token
    }

    function calculateChargeSwap() internal view returns (uint256) {
        MasterChefLikePool pool = MasterChefLikePool(STATIC_BUSD_STAKING_POOL);
        uint256 reward = pool.pendingReward(address(this), 0);
        if(reward > 0){
            reward = reward.mul(DIVISION_FACTOR.sub(percentStakeDepositor)).div(DIVISION_FACTOR); // Executors can only get a certain percent
            address[] memory path;
            uint256[] memory estimates;
            // CHARGE -> BUSD -> WBNB
            path = new address[](3);
            path[0] = address(CHARGE_ADDRESS);
            path[1] = address(tokenList[1].token);
            path[2] = WBNB_ADDRESS;  
            TradeRouter router = TradeRouter(PANCAKE_ROUTER);
            estimates = router.getAmountsOut(reward, path);
            reward = estimates[estimates.length - 1]; // This is the amount of WBNB returned
        }
        reward = reward.add(IERC20(WBNB_ADDRESS).balanceOf(address(this))); // Include any WBNB left over in contract
        return reward;
    }

    function unstakeAndRemoveFromLiquidityPool() internal {
        // Unstake the LP tokens
        // Receive the charge rewards and convert it to BUSD
        MasterChefLikePool pool = MasterChefLikePool(STATIC_BUSD_STAKING_POOL);
        (uint256 _bal, ) = pool.userInfo(0, address(this));
        if(_bal > 0){
            pool.withdraw(_bal, 0); // This will pull the tokens and the reward
        }

        handleChargeSwap(); // Will Convert Charge to BUSD/WBNB

        // Then unwrap back to native tokens
        TradeRouter router = TradeRouter(PANCAKE_ROUTER);
        IERC20 lpToken = IERC20(STATIC_BUSD_LP_TOKEN);
        if(lpToken.balanceOf(address(this)) == 0){return;}
        lpToken.safeApprove(address(router), 0);
        lpToken.safeApprove(address(router), lpToken.balanceOf(address(this)));
        router.removeLiquidity(address(tokenList[0].token), address(tokenList[1].token), lpToken.balanceOf(address(this)), 1, 1, address(this), now.add(60));
    }
    
    function checkAndSwapToken(address _executor) internal {
        lastTradeTime = now;

        // Unstake any tokens in the pool
        unstakeAndRemoveFromLiquidityPool(); // Will also pull rewards and convert some to WBNB

        performLiquidationOrBuyAction(_executor); // This will send the executor WBNB if something is done

        // Now restake
        addToLiquidityPoolAndStake();
        
        // Now take some gain bnb (from charge swap) and distribute it to executor, stakers and treasury
        IERC20 bnb = IERC20(WBNB_ADDRESS);
        uint256 bnbBalance = bnb.balanceOf(address(this));
        if(bnbBalance > 0){
            // This is pure profit, figure out allocation
            // Split the amount sent to the treasury, stakers and executor if one exists
            if(_executor != address(0)){
                uint256 gasFee = gasPrice.mul(gasStipend);
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
    
    // Returns 1) profit, 2) uint256 blocknumber, 3) code generated by executor address and seed
    function expectedProfit(address _executor, uint256 seed) external view returns (uint256,uint256,bytes32) {

        bytes32 executorCode = generateExecutorCode(_executor, seed);

        uint256 actionFee = calculateLiquidationOrBuyActionReturn();

        // Total profit of charge fee
        uint256 estimate = calculateChargeSwap();

        // Now calculate the amount going to the executor
        uint256 gasFee = gasPrice.mul(gasStipend); // This is gas stipend in wei
        if(gasFee >= estimate.mul(maxPercentStipend).div(DIVISION_FACTOR)){ // Max percent of total
            return (estimate.mul(maxPercentStipend).div(DIVISION_FACTOR).add(actionFee), block.number, executorCode); // The executor will get max percent of total
        }else{
            estimate = estimate.sub(gasFee); // Subtract fee from remaining balance
            return (estimate.mul(percentExecutor).div(DIVISION_FACTOR).add(gasFee).add(actionFee), block.number, executorCode); // Executor amount with fee added
        }
        
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
    
    // Accepts 1) address for where executor profit should go, 2) random seed, 3) code generated by random seed 4) uint256 minimum seconds required since last trade, 
    // 5) uint256 blocknumber that trade will expire after
    function executorSwapTokens(address _executor, uint256 seed, bytes32 code, uint256 _minSecSinceLastTrade, uint256 _deadlineBlock) external {
        // Function designed to promote trading with incentive. Users get percentage of WBNB from profitable trades
        checkExecutorCode(_executor, seed, code);
        require(block.number <= _deadlineBlock, "Deadline has expired, aborting trade");
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
    function changeTradingConditions(uint256 _pTradeTrigger, 
                                    uint256 _gasPrice,
                                    uint256 _pStipend,
                                    uint256 _maxStipend,
                                    uint256 _swapStipend) external onlyGovernance {
        // Changes a lot of trading parameters in one call
        require(_pTradeTrigger <= 100000 && _pStipend <= 100000,"Percent cannot be greater than 100%");
        percentTradeTrigger = _pTradeTrigger;
        maxPercentStipend = _pStipend;
        gasStipend = _maxStipend;
        gasPrice = _gasPrice;
        swapGasStipend = _swapStipend;
    }
    // --------------------

    // Change the trading conditions used by the strategy without timelock
    // --------------------
    function changePriceConditions(uint256 _minSupply, 
                                    uint256 _maxSpot,
                                    uint256 _minSell,
                                    uint256 _spotSell,
                                    uint256 _slippage,
                                    bool _checkSlip) external onlyGovernance {
        // Changes a lot of trading parameters in one call
        require(_slippage <= 100000,"Percent cannot be greater than 100%");
        minSupplyPrice = _minSupply;
        maxSpotBuyPrice = _maxSpot;
        minSellPrice = _minSell;
        spotSellPrice = _spotSell;
        allowedPriceSlippage = _slippage;
        checkPriceSlippage = _checkSlip;
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
    
    function startChangeStrategyAllocations(uint256 _pSDepositors, uint256 _pStakers, uint256 _pExecutor) external onlyGovernance {
        // Changes strategy allocations in one call
        require(_pExecutor <= 100000 && _pStakers <= 100000 && _pSDepositors <= 100000,"Percent cannot be greater than 100%");
        _timelockStart = now;
        _timelockType = 4;
        _timelock_data[0] = _pSDepositors;
        _timelock_data[1] = _pExecutor;
        _timelock_data[2] = _pStakers;
    }
    
    function finishChangeStrategyAllocations() external onlyGovernance timelockConditionsMet(4) {
        percentStakeDepositor = _timelock_data[0];
        percentExecutor = _timelock_data[1];
        percentStakers = _timelock_data[2];
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

        // Remove all tokens from strat
        MasterChefLikePool pool = MasterChefLikePool(STATIC_BUSD_STAKING_POOL);
        (uint256 _bal, ) = pool.userInfo(0, address(this));
        if(_bal > 0){
            pool.emergencyWithdraw(0); // This will pull the tokens only
        }
    }
    // --------------------
    
}
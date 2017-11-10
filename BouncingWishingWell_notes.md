
# How to use the BouncingWishingWell contract

The BouncingWishingWell contract has been deployed once (by me) to the Rinkeby testnet. To use it, make sure that you have a synced Rinkeby node running on your local machine.

We will interact with the contract via the Geth console. Launch the Geth console in Rinkeby mode. If your Rinkeby test node is already running, you can do this simply by calling:

```javascript
geth attach
```

In your Geth console, make sure that your account is unlocked:

```javascript
personal.unlockAccount('0x7345kjh...')
```

Create a javascript variable that holds the contract's ABI:

```javascript
var myABI = JSON.parse('[{"constant":false,"inputs":[],"name":"deposit","outputs":[{"name":"","type":"uint256"}],"payable":true,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"amount","type":"uint256"}],"name":"LogRoundOver","type":"event"}]');
```

Create a hook into the deployed contract:

```javascript
var well = eth.contract(myABI).at('0x8ae88e50ec2d803f6d59ea15a8f9105be0da2ebc');
```
Deposit exactly 0.06 ether to the contract via the 'deposit' function:

```javascript
well.deposit({from: eth.accounts[0], value: web3.toWei(0.06, "ether"), gas:'3000000'});
```

You should see your balance change within 30-60 seconds! GOOD LUCK!
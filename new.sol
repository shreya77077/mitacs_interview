// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TransactionList {
    struct Transaction { address sender; address receiver; uint256 amount; }
    Transaction[] public transactions;

    event NewTransaction(address indexed sender, address indexed receiver, uint256 amount);

    function addTransaction(address _receiver, uint256 _amount) external {
        require(_receiver != address(0) && _amount > 0, "Invalid receiver or amount");
        transactions.push(Transaction(msg.sender, _receiver, _amount));
        emit NewTransaction(msg.sender, _receiver, _amount);
    }

    function getTransactionCount() external view returns (uint256) {
        return transactions.length;
    }

    function getTransaction(uint256 _index) external view returns (address, address, uint256) {
        require(_index < transactions.length, "Invalid transaction index");
        Transaction storage t = transactions[_index];
        return (t.sender, t.receiver, t.amount);
    }
}

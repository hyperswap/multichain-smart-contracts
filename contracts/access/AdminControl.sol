// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity ^0.8.10;

abstract contract AdminControl {
    address public admin;

    event ChangeAdmin(address indexed _old, address indexed _new);

    constructor(address _admin) {
        require(_admin != address(0), "AdminControl: address(0)");
        admin = _admin;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "AdminControl: not admin");
        _;
    }

    function changeAdmin(address _admin) external onlyAdmin {
        require(_admin != address(0), "AdminControl: address(0)");
        emit ChangeAdmin(admin, _admin);
        admin = _admin;
    }
}

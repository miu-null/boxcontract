const {buildModule} = require("@nomicfoundation/hardhat-ignition/modules");

const TokenModule = buildModule("TokenModule", (m) => {
    const comment = m.contract("WriteComment");

    return {comment};
});

module.exports = TokenModule;

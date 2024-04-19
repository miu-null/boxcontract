import {HardhatUserConfig} from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import {Module} from "@nestjs/core/injector/module";
require("dotenv").config();
require("hardhat/config");

const INFURA_API_KEY = process.env.INFURA_API_KEY;
const SEPOLIA_PRIVATE_KEY = process.env.SEPOLIA_PRIVATE_KEY;

module.exports = {
    solidity: "0.8.24",
    networks: {
        sepolia: {
            url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
            account: [SEPOLIA_PRIVATE_KEY],
        },
    },
};

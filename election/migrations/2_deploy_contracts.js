/*var Election = artifacts.require("Election.sol");

module.exports = function(deployer) {
  deployer.deploy(Election, { gas: 5000000 });
};*/

const Election = artifacts.require("Election");

module.exports = function(deployer) {
  deployer.deploy(Election, "Candidate 1", "Candidate 2");
};

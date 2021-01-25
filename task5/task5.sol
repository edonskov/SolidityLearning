 SPDX-License-Identifier GPL-3.0

pragma solidity =0.6.0 0.8.0;

contract Task05 {

    mapping (address = bool) private web;
    mapping (address = bool) private desktop;
    mapping (address = bool) private mobile;
    mapping (address = bool) private hardware;


    function addWebElement(address _userAddress, bool _value) external{
        web[_userAddress] = _value;
    }
    function addDesktopElement(address _userAddress, bool _value) external{
        desktop[_userAddress] = _value;
    }
    function addMobileElement(address _userAddress, bool _value) external{
        mobile[_userAddress] = _value;
    }
    function addHardwareElement(address _userAddress, bool _value) external{
        hardware[_userAddress] = _value;
    }
    
    function getWeb(address userAddress) external view returns(bool) { 
        return web[userAddress];
    }
    function getDesktop(address userAddress) external view returns(bool) { 
        return desktop[userAddress];
    }
    function getMobile(address userAddress) external view returns(bool) { 
        return mobile[userAddress];
    }
    function getHardware(address userAddress) external view returns(bool) { 
        return hardware[userAddress];
    }

    function removeWeb(address _userAddress) external { 
        delete  web[_userAddress];
    }
    function removeDesktop(address _userAddress) external { 
        delete  desktop[_userAddress];
    }
    function removeMobile(address _userAddress) external { 
        delete  mobile[_userAddress];
    }
    function removeHardware(address _userAddress) external { 
        delete  hardware[_userAddress];
    }

}
function binance_miner --wraps='ethminer --farm-recheck 200 -P stratum+tcp://DustVoiceETH.Linux@ethash.poolbinance.com:1800' --description 'alias binance_miner=ethminer --farm-recheck 200 -P stratum+tcp://DustVoiceETH.Linux@ethash.poolbinance.com:1800'
    ethminer --farm-recheck 200 -P stratum+tcp://DustVoiceETH.Linux@ethash.poolbinance.com:1800 $argv; 
end

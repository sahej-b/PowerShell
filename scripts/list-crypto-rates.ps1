function ListCryptoRate { 
    param([string]$Symbol, [string]$Name)
	$Rates = (Invoke-WebRequest -URI "https://min-api.cryptocompare.com/data/price?fsym=$Symbol&tsyms=USD,EUR,RUB,CNY" -userAgent "curl" -useBasicParsing).Content | ConvertFrom-Json
	New-Object PSObject -property @{ 'Cryptocurrency' = "1 $Name ($Symbol) ="; 'USD' = "$($Rates.USD)"; 'EUR' = "$($Rates.EUR)"; 'RUB' = "$($Rates.RUB)"; 'CNY' = "$($Rates.CNY)" }
}

function ListCryptoRates { 
	ListCryptoRate BTC   "Bitcoin"
	ListCryptoRate ETH   "Ethereum"
	ListCryptoRate BUSD  "BUSD"
	ListCryptoRate XRP   "XRP"
	ListCryptoRate USDT  "Tether"
	ListCryptoRate AVAX  "Avalanche"
	ListCryptoRate LTC   "Litecoin"
	ListCryptoRate SOL   "Solana"
	ListCryptoRate GALA  "Gala"
	ListCryptoRate DOGE  "Dogecoin"
	ListCryptoRate ADA   "Cardano"
	ListCryptoRate BNB   "Binance Coin"
	ListCryptoRate USDC  "USD Coin"
	ListCryptoRate DOT   "Polkadot"
	ListCryptoRate UNI   "Uniswap"
	ListCryptoRate BUSD  "Binance USD"
	ListCryptoRate BCH   "Bitcoin Cash"
	ListCryptoRate LINK  "Chainlink"
	ListCryptoRate LUNA  "Terra"
	ListCryptoRate ICP   "Internet Computer"
	ListCryptoRate WBTC  "Wrapped Bitcoin"
	ListCryptoRate MATIC "Polygon"
	ListCryptoRate XLM   "Stellar"
}

try {
	ListCryptoRates | Format-Table -property @{e='Cryptocurrency';width=28},USD,EUR,RUB,CNY
	Write-Host "(by cryptocompare.com, Crypto is volatile and unregulated. Capital at risk. Taxes may apply)"
	Read-Host -Prompt "Press Enter to close"
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	Read-Host -Prompt "An error occurred. Press Enter to close"
}

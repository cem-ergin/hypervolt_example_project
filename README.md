## Versions

I use Flutter v2.5.1 for this project
## Folder Structure

![alt text](https://i.ibb.co/n63bNCx/IMG-447-FA99-B4554-1.jpg)

## Basic Page View

My whole home or main pages looks like this. I use ui folder as a view holder.

![alt text](https://i.ibb.co/TWw7yGz/IMG-49-F56-CE53533-1.jpg)

## Used Packages

  animate_do: ^2.0.0  => This is for animating "Crypto assets" section<br/> 
  cached_network_image: ^3.1.0 => This is for caching network images. This is useful for "Crypto assets" and "Live prices" sections. Also I use AutomaticKeepAliveClientMixin on "Crypto assets" section. Because Flutter ListView creating list items every time again. AutomaticKeepAliveClientMixin stops that.<br/>
  cupertino_icons: ^1.0.2<br/>
  equatable: ^2.0.3 => This is for compare models. It is amazingly useful on bloc. You can emit without changing any state with Equatable classes. UI will automatically setting state.<br/>
  flutter:<br/>
    sdk: flutter<br/>
  flutter_bloc: ^7.3.0  => State Management for BLoC Forever :)<br/>
  get_it: ^7.2.0 => This is for lazy registering classes. I use this for CryptoAssetRepository<br/>  
  http: ^0.13.3 => I can also use dio but I use http for this project.<br/>
  
  ## Some Screenshots and Gifs
 
![alt text](https://i.ibb.co/fqBZn8V/Screen-Shot-2021-09-23-at-14-52-29.png)
![alt text](https://i.ibb.co/0nJ6NFN/Screen-Shot-2021-09-23-at-14-52-48.png)
![alt text](https://i.ibb.co/DVC4zNp/4c7a5cd947471e3c8b4646baa773fb22c04044ec.gif)

  ## Note About Live Prices Section
  
  I am not using assets file for coin images. I am getting them from rest coin api.
  You can change below "subscribe_filter_symbol_id" codes and you can see whatever coin you want with its image. It is dynamic!

   ```
   socket.add(
      json.encode({
        "type": "hello",
        "apikey": ApiConstants.COIN_API_KEY,
        "heartbeat": false,
        "subscribe_data_type": ["trade"],
        "subscribe_filter_symbol_id": [
          r"COINBASE_SPOT_BTC_USD$",
          r"COINBASE_SPOT_ETH_USD$",
          r"COINBASE_SPOT_ADA_USD$",
          r"COINBASE_SPOT_BNB_USD$",
          r"COINBASE_SPOT_XRP_USD$",
          r"COINBASE_SPOT_NXT_USD$",
          r"COINBASE_SPOT_DOT_USD$",
          r"COINBASE_SPOT_PLN_USD$",
          r"COINBASE_SPOT_EUR_USD$",
          r"COINBASE_SPOT_DOGE_USD$",
        ]
      }),
    );
    ```


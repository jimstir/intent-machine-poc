import { Coinbase, Wallet } from "@coinbase/coinbase-sdk";
import axios from "axios";
let coinbase = Coinbase.configureFromJson({ filePath: '~/Downloads/cdp_api_key.json' });
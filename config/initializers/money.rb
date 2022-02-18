# Add custom OctoBot token
Money::Currency.register({
                           "priority": 1,
                           "iso_code": "OBT",
                           "name": "OctoBot Token",
                           "symbol": "🐙",
                           "alternate_symbols": [],
                           "subunit_to_unit": 1000,
                           "symbol_first": true,
                           "html_entity": "&#128025;",
                           "decimal_mark": ".",
                           "thousands_separator": ",",
                           "iso_numeric": "",
                           "smallest_denomination": 1
                         })
Money.add_rate("USD", "OBT", 100)

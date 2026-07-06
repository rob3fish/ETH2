{{ codegen.generate_source('eth_schema', 'eth', generate_columns=True, include_data_types=False) }}

{{ codegen.generate_model_yaml(['stg_transactions', 'int_transactions_enriched', 'fct_stablecoin_activity_per_day']) }}
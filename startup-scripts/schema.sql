CREATE TABLE IF NOT EXISTS ping_log (
    id            INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    createdateutc TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE ('UTC'::TEXT, NOW()),
    output        JSONB
);
CREATE VIEW view_ping_log AS (
    SELECT
        id,
        createdateutc,
        createdateutc AT TIME ZONE 'America/Denver'   AS create_date_mountain_time,
        createdateutc AT TIME ZONE 'America/New_York' AS create_date_eAStern_time,
        output->'packet_loss_percent'                 AS packet_loss_percent,
        output->'round_trip_ms_max'                   AS round_trip_ms_max,
        output->'round_trip_ms_min'                   AS round_trip_ms_min
    FROM ping_log
);

-- for metabase data
CREATE DATABASE metabaseappdb;

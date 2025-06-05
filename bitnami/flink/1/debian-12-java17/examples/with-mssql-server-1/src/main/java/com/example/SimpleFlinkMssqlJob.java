package com.example;

import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.table.api.Table;
import org.apache.flink.table.api.bridge.java.StreamTableEnvironment;
import org.apache.flink.types.Row;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SimpleFlinkMssqlJob {
    private static final Logger LOG = LoggerFactory.getLogger(SimpleFlinkMssqlJob.class);

    public static void main(String[] args) throws Exception {
        LOG.info("Starting Flink MSSQL Test Job");

        // Cấu hình kết nối JDBC tới SQL Server local
        String jdbcUrl = "jdbc:sqlserver://sqlserver:1433;databaseName=snp_data_dev;encrypt=false";
        String username = "sa";
        String password = "YourStrong@Passw0rd";
        String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

        // Tạo execution environment
        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();
        final StreamTableEnvironment tableEnv = StreamTableEnvironment.create(env);

        LOG.info("Defining table in Flink Table API");
        // Định nghĩa bảng trong Flink
        tableEnv.executeSql(
                """
                CREATE TABLE test_table (
                    test_column INT
                ) WITH (
                    'connector' = 'jdbc',
                    'url' = '%s',
                    'table-name' = 'test_table',
                    'driver' = '%s',
                    'username' = '%s',
                    'password' = '%s'
                )
                """.formatted(jdbcUrl, driverName, username, password)
        );

        LOG.info("Inserting sample data into test_table");
        // Chèn một bản ghi mẫu
        tableEnv.executeSql("INSERT INTO test_table VALUES (1)");

        LOG.info("Executing SELECT query on test_table");
        // Thực hiện truy vấn SELECT
        Table resultTable = tableEnv.sqlQuery("SELECT test_column FROM test_table");

        // Chuyển Table thành DataStream và in kết quả
        DataStream<Row> resultStream = tableEnv.toDataStream(resultTable);
        resultStream.print();
    }
}
# sql_tutorial
 
好的，我们可以通过一个简单的例子来展示如何使用`sqlite3`在你的Mac上创建一个SQLite数据库，并执行一些基本的SQL命令。在这个例子中，我们将创建一个名为`example.db`的数据库，并在其中创建一个名为`users`的表，用于存储用户信息。然后，我们会向这个表中插入一些数据，并执行一个查询来检索数据。

### 步骤 1: 创建数据库和表

1. 打开你的终端（Terminal）。
2. 输入`sqlite3 example.db`命令并按回车,打开 example.db。进入一个交互式对话
3. 在sqlite提示符下，输入以下SQL命令来创建一个新表`users`：
   ```sql
   CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, email TEXT);
   ```
   这个`users`表包含三个字段：`id`（主键，整型），`name`（文本类型）和`email`（文本类型）。

### 步骤 2: 向表中插入数据

在同一个sqlite交互式会话中，使用`INSERT INTO`语句向`users`表中插入一些数据：
```sql
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com');
```

### 步骤 3: 查询数据

现在，我们可以执行一个简单的`SELECT`语句来检索`users`表中的所有记录：
```sql
SELECT * FROM users;
```
这将显示你刚才插入的所有用户记录。

### 步骤 4: 退出sqlite3

完成后，你可以输入`.quit`命令退出sqlite3交互式会话。

### 小结

这个简单的例子展示了如何在Mac上使用预装的`sqlite3`创建一个SQLite数据库，如何创建一个表，向表中插入数据，以及如何查询这些数据。SQLite是一个非常轻量级的数据库系统，非常适合于小型项目、原型开发或者学习数据库基础。
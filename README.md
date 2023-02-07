## Testing of prqlc with a dbt project

[prqlc](https://crates.io/crates/prqlc) is a CLI for prql-compiler, which
compiles [PRQL](https://prql-lang.org/) to SQL.

This project is an example of how to use `prqlc watch` command with dbt. It is
based on [jaffle_shop](https://github.com/dbt-labs/jaffle_shop) project.

### Running this project

To get up and running with this project:

1. Install dbt using
   [these instructions](https://docs.getdbt.com/docs/installation).

2. Clone this repository.

3. Change into the `jaffle_shop` directory from the command line:

```bash
$ cd jaffle_shop
```

4. Set up a profile called `jaffle_shop` to connect to a data warehouse by
   following
   [these instructions](https://docs.getdbt.com/docs/configure-your-profile). If
   you have access to a data warehouse, you can use those credentials – we
   recommend setting your
   [target schema](https://docs.getdbt.com/docs/configure-your-profile#section-populating-your-profile)
   to be a new schema (dbt will create the schema for you, as long as you have
   the right privileges). If you don't have access to an existing data
   warehouse, you can also setup a local postgres database and connect to it in
   your profile.

5. Run `prqlc watch models/`. This will compile all .prql files to .sql and
   watch directory for changes.

6. Run any dbt commands:

```bash
$ dbt debug
$ dbt seed
$ dbt run
$ dbt test
$ dbt docs generate
$ dbt docs serve
```

### Results

The setup is quite useable: `{{ ref(...) }}`, `{{ config(...) }}` and
`{{ set(...) }}` work as expected.

In my opinion, .prql files are much more concise and readable compared to .sql.

It does not have full functionality: any Jinja evaluation that does not produce
a single token will not work correctly. Specifically, for loop don't work.

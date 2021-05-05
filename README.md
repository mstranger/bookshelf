# Bookshelf

This is a starter Hanami (1.3) project with additional steps and actions.

## What is done

books

- `:books` completed resource and model
- bootstrap layout with css and js assets
- flash messages, dynamic titles, partials
- basic validatations
- all tests for books
- navbar with auth stubs

users

- `:users` resource (index, new, create actions) and model
- association `has_many` and `belongs_to`
- tests for associations and users
- now books relate to users

You can find examples of creating users or books in the `db/seed.rb` file.

## Setup

Setup (create and migrate) database for _dev_ and _test_ environments:

```bash
% bundle exec hanami db prepare
% HANAMI_ENV=test bundle exec hanami db prepare
```

Run dev server:

```bash
% bundle exec hanami server
```

and go to [localhost:2300](http://localhost:2300) by default

Run tests:

```bash
% bundle exec rake
```

Run console:

```bash
% bendle exec hanami console
```

**NOTE:** Use `RUBYOPT='-W0'` for suppress warnings if need.

---

More resources:

- [guides](https://guides.hanamirb.org/)
- [API docs](http://docs.hanamirb.org/1.3.3/)
- [chat](http://chat.hanamirb.org)

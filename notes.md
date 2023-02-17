# Todo Surf

## Problem / Requirements

Be able to record places I have surfed.

Record places I want to Surf

- and then be able to tick off when surfed there

Long term goals

- have on a map places I have surfed

## Modelling

### Surf

-> belong to user
`t.belongs_to :user, null: false, foreign_key: true`

how would you do this in another migration if you had already made the surf and users table?

`rails g migration add_references_to_surfs user:references`

-> belong to location
-> belong to board

`rails g resource Surfs date:datetime notes:text surfed:boolean rating:integer`

- ✅ date time
- ✅ surfed or not / done or not done
- ✅ rating
- ✅ notes
  - conditions?
  - photo?

Co Pilot thought it should have:
- has_many :surf_photos, dependent: :destroy
- has_many :surf_comments, dependent: :destroy
- has_many :surf_likes, dependent: :destroy
- has_many :surf_reports, dependent: :destroy


### User

`rails g resource User name:string email:string profile:text`

-> has many surfs
-> has many locations through surfs ?????
-> has many boards

- ✅ name
- ✅ email
- ✅ profile


### Board

```
rails g resource Board name:string length:integer volume:integer
```

-> has many surfs
-> belongs to user

- name
- length - this should be in inches!
- volume (optional)


### Location (surf spot)

`rails g resource Location name:string longitude:float latitude:float private:boolean`

-> has many surfs
-> has many users through surfs

- longitude / latitude
  - postgis
- name
- private or not

  Nice to have
  - weather conditions

## Next

- rails Api
- Frontend
  1. basic html / vanilla JS
  2. inbetween - virtual DOM library / vanilla plus libraries
  3. JS frameworks e.g. Vue

---

## Rails Api App

`bundle init`  to create a gemfile in folder, set to rails 7, do `bundle install` then

`rails new surf_api --api --database=postgresql --skip-test-unit`

Data structure for a `Surf`:

- date time
- surfed or not / done or not done
- rating
- notes
  - conditions?
  - photo?

```bash
rails generate resource Surfs date:datetime notes:text surfed:boolean rating:integer
```

## Todo

- [ ]  create other resources
- [ ]  create a surf - with associations

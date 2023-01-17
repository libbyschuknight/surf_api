# Todo Surf

## Problem / Requirements

Be able to record places I have surfed.

Record places I want to surf

- and then be able to tick off when surfed there

Long term goals

- have on a map places I have surfed

## Modelling

User
-> has many surfs
-> has many locations through surfs
-> has many boards

- name
- email
- profile

Surf
-> belong to user
-> belong to location
-> belong to board

- date time
- surfed or not / done or not done
- rating
- notes
  - conditions?
  - photo?


Board
-> has many surfs
-> belongs to user

- name
- length
- size (optional)


Location (surf spot)
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

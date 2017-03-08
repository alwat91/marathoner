# Marathoner
This is a lightweight app for keeping track of runs

## ERD

### Entities

#### User

```
id: Integer,
email: String,
password_digest: String,
has_many runs
```

#### Run

```
id: Integer,
mileage: Float,
beginning_time: String,
end_time: String,
duration: String
belongs_to user
```

## Wireframes

### Home Page
<img width="777" alt="homepage" src="https://cloud.githubusercontent.com/assets/23660271/23713952/8db449b0-03f5-11e7-8dcd-a145b57ab6dd.png">
### Runs index
<img width="810" alt="runs index" src="https://cloud.githubusercontent.com/assets/23660271/23713969/a351c1c6-03f5-11e7-8337-4b1d1137f129.png">
### Edit Run 
<img width="809" alt="edit run" src="https://cloud.githubusercontent.com/assets/23660271/23713985/ac4a658a-03f5-11e7-886a-296aad7ae5fa.png">

### New Run

### Sign in
### Sign up

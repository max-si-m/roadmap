package main

import (
    "database/sql"
    "flag"
    "fmt"
    _ "github.com/lib/pq"
    "strconv"
    "math/rand"
    "gopkg.in/cheggaaa/pb.v1"
)

func main() {
    db_user := flag.String("user", "max-si-m", "a string")
    db_name := flag.String("db", "some_db", "a string")
    db_password := flag.String("password", "000000", "a string")
    flag.Parse()

    dbinfo := fmt.Sprintf("user=%s password=%s dbname=%s sslmode=disable",
        *db_user, *db_password, *db_name)
    db, err := sql.Open("postgres", dbinfo)
    checkErr(err)
    defer db.Close()

    generateUsers(db)
    generatePosts(db)
}

func checkErr(err error) {
    if err != nil {
        panic(err)
    }
}

func generateUsers(db *sql.DB) {
    fmt.Println("[USERS] starts")
    count := 10000
    bar := pb.StartNew(count)
    for i := 0; i < 10000; i++ {
        insertUserData(i, db)
        bar.Increment()
    }
    bar.FinishPrint("The End!")
    fmt.Println("[USERS] done")
}

func generatePosts(db *sql.DB) {
    fmt.Println("[POSTS] starts")
    count := 10
    bar := pb.StartNew(count)
    bar.ShowCounters = true
    for i := 0; i < count; i++ {
        smallPostGeneration(db)
        bar.Increment()
    }
    bar.FinishPrint("The End!")
    fmt.Println("[POSTS] done")
}

func smallPostGeneration(db *sql.DB) {
    for i := 0; i < 10000; i++ {
        insertPostData(i, db)
    }
}
func insertUserData(i int, db *sql.DB) {
    var email string = "some_email@ex.ua " + strconv.Itoa(i)
    var name string = "Super User # " + strconv.Itoa(i)
    var id int
    err := db.QueryRow("INSERT INTO users(email, name, created_at, updated_at) VALUES($1, $2, NOW(), NOW()) returning id;", email, name).Scan(&id)
    checkErr(err)
}

func insertPostData(i int, db *sql.DB) {
    var title string = "Post title # " + strconv.Itoa(i)
    var body string = "Body for some post like #" + strconv.Itoa(i)
    var user_id int = rand.Intn(100)
    if user_id == 0 {
        user_id = 1
    }

    var id int
    err := db.QueryRow("INSERT INTO posts(title, body, user_id, created_at, updated_at) VALUES($1, $2, $3, NOW(), NOW()) returning id;", title, body, user_id).Scan(&id)
    checkErr(err)
}

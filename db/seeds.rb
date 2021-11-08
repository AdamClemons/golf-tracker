users_list = {
    "par_guy" => {
        :password_digest => "password"
    },
    "bogey_guy" => {
        :password_digest => "password"
    },
    "double_bogey_guy" => {
        :password_digest => "password"
    },
    "birdie_guy" => {
        :password_digest => "password"
    },
    "eagle_guy" => {
        :password_digest => "password"
    }
}

users_list.each do |username, user_hash|
    user = User.new
    user.username = username
    user_hash.each do |attribute, value|
        user[attribute] = value
    end
    user.save
end

clubs_list = {
    "Driver" => {},
    "3 Wood" => {},
    "5 Wood" => {},
    "Hybrid" => {},
    "3 iron" => {},
    "4 iron" => {},
    "5 iron" => {},
    "6 iron" => {},
    "7 iron" => {},
    "8 iron" => {},
    "9 iron" => {},
    "Pitching Wedge" => {},
    "Gap Wedge" => {},
    "Sand Wedge" => {},
    "Lob Wedge" => {},
    "Putter" => {}
}

clubs_list.each do |name, club_hash|
    club = Club.new
    club.name = name
    club_hash.each do |attribute, value|
        club[attribute] = value
    end
    club.save
end

def time_rand from = Time.new(2021, 1, 1), to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

User.all.each do |user|
    10.times do
        course_id = rand(1..3)
        score = rand(70..105)
        date = time_rand
        Score.create(user_id: user.id, course_id: course_id, score: score, date: date)
    end
end

Course.create(name:"Falls Rd", par:70)
Course.create(name:"Poolesville", par:72)
Course.create(name:"Downtown", par:72)

User.all.each do |user|
    user_club_array = [
        {
            club_id: Club.find_by(name: "Driver").id,
            distance: rand(200..300)
        },
        {
            club_id: Club.find_by(name: "3 Wood").id,
            distance: rand(180..260)
        },
        {
            club_id: Club.find_by(name: "5 Wood").id,
            distance: rand(170..240)
        },
        {
            club_id: Club.find_by(name: "Hybrid").id,
            distance: rand(160..240)
        },
        {
            club_id: Club.find_by(name: "3 iron").id,
            distance: rand(160..210)
        },
        {
            club_id: Club.find_by(name: "4 iron").id,
            distance: rand(150..200)
        },
        {
            club_id: Club.find_by(name: "5 iron").id,
            distance: rand(145..190)
        },
        {
            club_id: Club.find_by(name: "6 iron").id,
            distance: rand(140..180)
        },
        {
            club_id: Club.find_by(name: "7 iron").id,
            distance: rand(135..170)
        },
        {
            club_id: Club.find_by(name: "8 iron").id,
            distance: rand(130..160)
        },
        {
            club_id: Club.find_by(name: "9 iron").id,
            distance: rand(120..150)
        },
        {
            club_id: Club.find_by(name: "Pitching Wedge").id,
            distance: rand(110..135)
        },
        {
            club_id: Club.find_by(name: "Gap Wedge").id,
            distance: rand(100..120)
        },
        {
            club_id: Club.find_by(name: "Sand Wedge").id,
            distance: rand(85..110)
        },
        {
            club_id: Club.find_by(name: "Lob Wedge").id,
            distance: rand(60..80)
        },
        {
            club_id: Club.find_by(name: "Putter").id,
            distance: 0
        },
    ]

    user_club_array.each do |user_club|
        user_club[:user_id] = user.id
        UserClub.create(user_club)
    end
end
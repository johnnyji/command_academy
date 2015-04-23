# Homepage (Root path)
get '/' do
  erb :index
end

get '/begin' do
  # @challenge = Challenge.all.order('level DESC').limit(1).first
  erb :challenges
end

get '/challenges' do
  challenges = Challenge.order(level: :asc)
  # challenges = [
  #   {
  #     instructions: "This is the instructions for challenge 1",
  #     success: "SUCCESS Challenge 1",
  #     fail: "FAIL Challenge 1",
  #     level: 0,
  #     answer: "pwd",
  #     console_text: "/Users/owner/desktop"
  #   },
  #   {
  #     instructions: "This is the instructions for challenge 2",
  #     success: "SUCCESS Challenge 2",
  #     fail: "FAIL Challenge 2",
  #     level: 1,
  #     answer: "ls",
  #     console_text: "photos documents public \n\n vacation work personal"
  #   },
  #   {
  #     instructions: "This is the instructions for challenge 3",
  #     success: "SUCCESS Challenge 3",
  #     fail: "FAIL Challenge 3",
  #     level: 2,
  #     answer: "mkdir project",
  #     console_text: ""
  #   },
  # ]
  content_type :json
    challenges.to_json
end

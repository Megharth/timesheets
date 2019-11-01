# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheets.Repo.insert!(%Timesheets.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Timesheets.Repo

alias Timesheets.Users.Manager
alias Timesheets.Users.Worker
alias Timesheets.Jobs.Job
alias Timesheets.Sheets.Sheet


pw = Argon2.hash_pwd_salt("helloworld")

Repo.insert!(%Manager{name: "Alice", email: "alice@example.com", password_hash: pw})
Repo.insert!(%Manager{name: "Bob", email: "bob@example.com", password_hash: pw})
Repo.insert!(%Worker{name: "John", email: "jon@doe.com", password_hash: pw, manager_id: 1, pay: "12"})
Repo.insert!(%Worker{name: "Lorem", email: "lorem@ipsum.com", password_hash: pw, manager_id: 1, pay: "15"})
Repo.insert!(%Worker{name: "Foo", email: "foo@bar.com", password_hash: pw, manager_id: 2, pay: "18"})
Repo.insert!(%Worker{name: "Johny", email: "johny@english.com", password_hash: pw, manager_id: 2, pay: "20"})
Repo.insert!(%Job{jobCode: "A101", name: "Job One", budget: 1200, manager_id: 1, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu neque vel massa elementum condimentum. Phasellus lectus sapien, pellentesque nec molestie eget, interdum eu lacus. Pellentesque non tortor pulvinar, malesuada risus ut, tempor nibh. Maecenas id sapien elit. Sed laoreet vel leo at ultricies. In nec luctus lacus, in imperdiet nisi. In eu mattis neque. Proin faucibus rhoncus lorem. Curabitur sapien felis, lacinia at ligula nec, fermentum congue nisl. Phasellus in mauris sed mauris hendrerit efficitur. Donec rutrum eget libero eget luctus. Suspendisse venenatis lacus velit, at consectetur turpis pretium vitae. Morbi at orci viverra felis fringilla commodo. Nam viverra efficitur lacinia.

Aliquam fringilla est nec ipsum pretium, vel dapibus tellus tristique. Vestibulum consectetur porta massa sit amet accumsan. In posuere, orci vitae tincidunt dignissim, est elit lacinia orci, non blandit ligula erat eu massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum tempor aliquam molestie. In eleifend ullamcorper nulla vitae tristique. Cras varius neque dui, nec pharetra metus rhoncus eget. Sed suscipit auctor ante, ac feugiat enim ultrices vel. Quisque rhoncus tellus et tempor accumsan. Nunc elementum cursus mi. Suspendisse a lobortis ligula, id elementum diam.

Ut pulvinar ac velit et fringilla. Maecenas congue eleifend lacus, at tristique dui pharetra ut. Suspendisse ante massa, feugiat vel luctus ac, iaculis eget quam. Sed rutrum ante ut metus interdum interdum. Suspendisse in venenatis ex. Phasellus quam purus, ultricies sed leo ac, fermentum vulputate lorem. Cras placerat maximus mi et commodo. Vestibulum gravida mauris eu ligula tincidunt volutpat. Aenean luctus maximus purus, in ultricies metus. Nulla rutrum sodales tincidunt. Integer maximus eget arcu rutrum vulputate. Cras vitae magna ac dolor ultrices tincidunt sit amet vel felis."})
Repo.insert!(%Job{jobCode: "A102", name: "Job Two", budget: 1800, manager_id: 1, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu neque vel massa elementum condimentum. Phasellus lectus sapien, pellentesque nec molestie eget, interdum eu lacus. Pellentesque non tortor pulvinar, malesuada risus ut, tempor nibh. Maecenas id sapien elit. Sed laoreet vel leo at ultricies. In nec luctus lacus, in imperdiet nisi. In eu mattis neque. Proin faucibus rhoncus lorem. Curabitur sapien felis, lacinia at ligula nec, fermentum congue nisl. Phasellus in mauris sed mauris hendrerit efficitur. Donec rutrum eget libero eget luctus. Suspendisse venenatis lacus velit, at consectetur turpis pretium vitae. Morbi at orci viverra felis fringilla commodo. Nam viverra efficitur lacinia.

Aliquam fringilla est nec ipsum pretium, vel dapibus tellus tristique. Vestibulum consectetur porta massa sit amet accumsan. In posuere, orci vitae tincidunt dignissim, est elit lacinia orci, non blandit ligula erat eu massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum tempor aliquam molestie. In eleifend ullamcorper nulla vitae tristique. Cras varius neque dui, nec pharetra metus rhoncus eget. Sed suscipit auctor ante, ac feugiat enim ultrices vel. Quisque rhoncus tellus et tempor accumsan. Nunc elementum cursus mi. Suspendisse a lobortis ligula, id elementum diam.

Ut pulvinar ac velit et fringilla. Maecenas congue eleifend lacus, at tristique dui pharetra ut. Suspendisse ante massa, feugiat vel luctus ac, iaculis eget quam. Sed rutrum ante ut metus interdum interdum. Suspendisse in venenatis ex. Phasellus quam purus, ultricies sed leo ac, fermentum vulputate lorem. Cras placerat maximus mi et commodo. Vestibulum gravida mauris eu ligula tincidunt volutpat. Aenean luctus maximus purus, in ultricies metus. Nulla rutrum sodales tincidunt. Integer maximus eget arcu rutrum vulputate. Cras vitae magna ac dolor ultrices tincidunt sit amet vel felis."})
Repo.insert!(%Job{jobCode: "A101", name: "Job Three", budget: 2000, manager_id: 2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu neque vel massa elementum condimentum. Phasellus lectus sapien, pellentesque nec molestie eget, interdum eu lacus. Pellentesque non tortor pulvinar, malesuada risus ut, tempor nibh. Maecenas id sapien elit. Sed laoreet vel leo at ultricies. In nec luctus lacus, in imperdiet nisi. In eu mattis neque. Proin faucibus rhoncus lorem. Curabitur sapien felis, lacinia at ligula nec, fermentum congue nisl. Phasellus in mauris sed mauris hendrerit efficitur. Donec rutrum eget libero eget luctus. Suspendisse venenatis lacus velit, at consectetur turpis pretium vitae. Morbi at orci viverra felis fringilla commodo. Nam viverra efficitur lacinia.

Aliquam fringilla est nec ipsum pretium, vel dapibus tellus tristique. Vestibulum consectetur porta massa sit amet accumsan. In posuere, orci vitae tincidunt dignissim, est elit lacinia orci, non blandit ligula erat eu massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum tempor aliquam molestie. In eleifend ullamcorper nulla vitae tristique. Cras varius neque dui, nec pharetra metus rhoncus eget. Sed suscipit auctor ante, ac feugiat enim ultrices vel. Quisque rhoncus tellus et tempor accumsan. Nunc elementum cursus mi. Suspendisse a lobortis ligula, id elementum diam.

Ut pulvinar ac velit et fringilla. Maecenas congue eleifend lacus, at tristique dui pharetra ut. Suspendisse ante massa, feugiat vel luctus ac, iaculis eget quam. Sed rutrum ante ut metus interdum interdum. Suspendisse in venenatis ex. Phasellus quam purus, ultricies sed leo ac, fermentum vulputate lorem. Cras placerat maximus mi et commodo. Vestibulum gravida mauris eu ligula tincidunt volutpat. Aenean luctus maximus purus, in ultricies metus. Nulla rutrum sodales tincidunt. Integer maximus eget arcu rutrum vulputate. Cras vitae magna ac dolor ultrices tincidunt sit amet vel felis."})
Repo.insert!(%Job{jobCode: "A101", name: "Job Four", budget: 1500, manager_id: 2, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu neque vel massa elementum condimentum. Phasellus lectus sapien, pellentesque nec molestie eget, interdum eu lacus. Pellentesque non tortor pulvinar, malesuada risus ut, tempor nibh. Maecenas id sapien elit. Sed laoreet vel leo at ultricies. In nec luctus lacus, in imperdiet nisi. In eu mattis neque. Proin faucibus rhoncus lorem. Curabitur sapien felis, lacinia at ligula nec, fermentum congue nisl. Phasellus in mauris sed mauris hendrerit efficitur. Donec rutrum eget libero eget luctus. Suspendisse venenatis lacus velit, at consectetur turpis pretium vitae. Morbi at orci viverra felis fringilla commodo. Nam viverra efficitur lacinia.

Aliquam fringilla est nec ipsum pretium, vel dapibus tellus tristique. Vestibulum consectetur porta massa sit amet accumsan. In posuere, orci vitae tincidunt dignissim, est elit lacinia orci, non blandit ligula erat eu massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum tempor aliquam molestie. In eleifend ullamcorper nulla vitae tristique. Cras varius neque dui, nec pharetra metus rhoncus eget. Sed suscipit auctor ante, ac feugiat enim ultrices vel. Quisque rhoncus tellus et tempor accumsan. Nunc elementum cursus mi. Suspendisse a lobortis ligula, id elementum diam.

Ut pulvinar ac velit et fringilla. Maecenas congue eleifend lacus, at tristique dui pharetra ut. Suspendisse ante massa, feugiat vel luctus ac, iaculis eget quam. Sed rutrum ante ut metus interdum interdum. Suspendisse in venenatis ex. Phasellus quam purus, ultricies sed leo ac, fermentum vulputate lorem. Cras placerat maximus mi et commodo. Vestibulum gravida mauris eu ligula tincidunt volutpat. Aenean luctus maximus purus, in ultricies metus. Nulla rutrum sodales tincidunt. Integer maximus eget arcu rutrum vulputate. Cras vitae magna ac dolor ultrices tincidunt sit amet vel felis."})
Repo.insert!(%Sheet{date: ~D[2019-11-01], hour_0: 3.0, hour_1: 5.0, hour_2: 0.0,
  hour_3: 0.0, hour_4: 0.0, hour_5: 0.0, hour_6: 0.0, hour_7: 0.0,
  job_0: "A102", job_1: "A101", job_2: "None", job_3: "None", job_4: "None",
  job_5: "None", job_6: "None", job_7: "None", worker_id: 1
})

Repo.insert!(%Sheet{date: ~D[2019-11-01], hour_0: 3.0, hour_1: 5.0, hour_2: 0.0,
  hour_3: 0.0, hour_4: 0.0, hour_5: 0.0, hour_6: 0.0, hour_7: 0.0,
  job_0: "A102", job_1: "A101", job_2: "None", job_3: "None", job_4: "None",
  job_5: "None", job_6: "None", job_7: "None", worker_id: 2
})

Repo.insert!(%Sheet{date: ~D[2019-11-01], hour_0: 3.0, hour_1: 5.0, hour_2: 0.0,
  hour_3: 0.0, hour_4: 0.0, hour_5: 0.0, hour_6: 0.0, hour_7: 0.0,
  job_0: "A102", job_1: "A101", job_2: "None", job_3: "None", job_4: "None",
  job_5: "None", job_6: "None", job_7: "None", worker_id: 3
})

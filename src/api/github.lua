function getGit(github_path, program) -- function to get git

    local github_url = "https://raw.githubusercontent.com/DinnerBeef/ComputerCraft-Monitor/main/src/"..github_path

    local request = http.get( github_url )
    local response = request.readAll()
    request.close()

    local file = fs.open( program, "w" )
    file.write( response )
    file.close()

end
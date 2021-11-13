os.loadAPI("api/github")
print("Starting Up")

if fs.exists("downloader") then
    fs.delete("downloader")
    print("Downloader deleted")
end

if fs.exists("util/runner.lua") then
    fs.delete("util/runner.lua")
end

github.getGit("util/runner.lua", "util/runner")

shell.run("util/runner")
os.loadAPI("api/github")
print("Starting Up")

if fs.exists("downloader") then
    fs.delete("downloader")
    Print("Downloader deleted")
end

if fs.exists("util/run.lua") then
    fs.delete("util/run.lua")
end

github.getGit("util/run.lua", "util/run")

shell.run("util/run")
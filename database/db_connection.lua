connection = dbConnect('sqlite', 'database.db')

if (connection) then
    outputDebugString('Successfully connected to database', 3, 0, 255, 0)
else
    outputDebugString('Couldnt connect to database', 3, 255, 0, 0)
end
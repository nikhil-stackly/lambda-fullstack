exports.handler = async (event) => {

    const response = {
        statusCode: 200,
        headers: {
            "Access-Control-Allow-Origin": "*"
        },
        body: JSON.stringify({
            message: "Hello from Lambda Full Stack Automation 🚀",
            input: event
        })
    };

    return response;
};

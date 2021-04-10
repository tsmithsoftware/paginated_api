'use strict';

const { Sequelize, DataTypes } = require('sequelize');
var url = require("url");
const express = require('express');
var connectionString = 'postgres://user:example@192.168.0.17:5432/db'   //process.env.DATABASE_URL//
console.log('database url from env is: ', connectionString)
// set timezone
process.env.TZ = 'Europe/London';
const sequelize = new Sequelize(connectionString);

async function main() {
    
    try {
        await sequelize.authenticate();
        console.log("Connection has authed successfully");
    } catch (error) {
        console.error("Unable to connect to the database", error);
    }
    

    
}
// Constants
const PORT = 4000;
const HOST = '0.0.0.0';

const app = express()

main().then(console.log("Success!")).catch(console.error);

// define Site model
const site = sequelize.define('site', {
    id: {
        primaryKey: true,
        type: DataTypes.INTEGER,
        allowNull: false
    },
    siteid: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    sapid: {
        type: DataTypes.STRING,
        allowNull: false
    },
    sapretailno: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    sitename: {
        type: DataTypes.STRING,
        allowNull: false
    },
    town: {
        type: DataTypes.STRING,
        allowNull: false
    },
    channeloftrade: {
        type: DataTypes.STRING,
        allowNull: true
    },
    installationcount: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    createddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    lastupdateddatetime: {
        type: DataTypes.DATE,
        allowNull: false
    },
    countryid: {
        type: DataTypes.INTEGER,
        allowNull: false
    }
}, {
    timestamps: false
})

app.get('/test', async (req,res) =>  {
    const page = parseInt(req.query.page)
    const limit = parseInt(req.query.limit)

    const startIndex = (page - 1) * limit
    const endIndex = limit

    console.log("startIndex: " + startIndex);
    console.log("endIndex: " + endIndex);

    const sites = await site.findAndCountAll(
        {
            limit: endIndex, 
            offset: startIndex
        });

    var result = {};
    result.count = sites.count;
    result.page = page;
    result.sites = sites.rows;
    res.json(result);
})

app.listen(3000)
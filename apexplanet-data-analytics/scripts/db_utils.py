import sqlite3
import pandas as pd


def get_connection():

    conn = sqlite3.connect(

        '../database/superstore.db'

    )

    return conn


def run_query(query):

    conn = get_connection()

    result = pd.read_sql(query, conn)

    conn.close()

    return result
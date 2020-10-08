import os
import sys
import json
import pathlib
import requests


def start_recording():
    res = requests.post(os.path.join(URL,"_appmap/record"))
    if res.status_code == 200:
        print("\nrecording session has started...")
    elif res.status_code == 409:
        print("An existing recording session is in progress")
    else:
        print("invalid response code {}, make sure browser recording is enabled".format(req.status_code))


def stop_recording(appmap_filename):
    res = requests.delete(os.path.join(URL,"_appmap/record"))
    if res.status_code == 200:
        print("current recording session has stopped")

        full_path_name = os.path.join(os.getcwd(), OUTPUT_DIR, appmap_filename + ".appmap.json")
        with open(full_path_name, "w+") as file:
            file.write(json.dumps(res.json()))

    elif res.status_code == 404:
        print("no active recording session to stop")
    else:
        print("invalid response code {}, make sure browser recording is enabled".format(req.status_code))


def run_tests():
    """
    TODO: remove this later

    Trouble tests:
    - run_queries POST      /queries/run(.:format)            blazer/queries#run
    - cancel_queries POST   /queries/cancel(.:format)         blazer/queries#cancel
    - refresh_queries POST  /queries/:id/refresh(.:format)    blazer/queries#refresh


    """

    # TODO

    # tables_queries GET
    start_recording()
    res = requests.get(os.path.join(URL, "queries/tables","?data_source=main"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Query_Tables")

    # schema_queries GET
    start_recording()
    res = requests.get(os.path.join(URL, "queries/schema","?data_source=main"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Query_Schema")

    # docs_queries GET
    start_recording()
    res = requests.get(os.path.join(URL, "queries/docs","?data_source=main"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Query_Docs")

    # queries GET
    start_recording()
    index = 10
    res = requests.get(os.path.join(URL, "queries", str(index)))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Query_Docs")

    # new_query GET
    start_recording()
    res = requests.get(os.path.join(URL, "queries/new"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_New_Query_Form")

    # edit_query GET
    start_recording()
    index = 10
    res = requests.get(os.path.join(URL,"queries", str(index), "edit"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Edit_Query_Form")

    # checks GET
    start_recording()
    res = requests.get(os.path.join(URL, "checks"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Check")

    # new_check GET
    start_recording()
    res = requests.get(os.path.join(URL, "checks/new"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Run_Check")

    # TODO
    # run_check GET
    start_recording()
    index = 10
    res = requests.get(os.path.join(URL, "checks", str(id), "run"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Run_Check")

    # TODO - going to 'edit' under a query goes to 'queries/id/edit'
    # edit_check GET
    start_recording()
    index = 10
    res = requests.get(os.path.join(URL, "checks", str(index), "edit"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Edit_Check_Form")

    # new_dashboard GET
    start_recording()
    res = requests.get(os.path.join(URL, "dashboards/new"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_New_Dashboard")

    # edit_dashboard GET
    start_recording()
    index = "1-dashboard-demo"
    res = requests.get(os.path.join(URL, "dashboards", index, "edit"))
    print("response code: {}".format(res.status_code))
    stop_recording("Get_Edit_Dashboard_Form")


# Routes for Blazer::Engine:
#       run_queries POST   /queries/run(.:format)            blazer/queries#run
#    cancel_queries POST   /queries/cancel(.:format)         blazer/queries#cancel
#     refresh_query POST   /queries/:id/refresh(.:format)    blazer/queries#refresh
#                   POST   /queries(.:format)                blazer/queries#create

#             query GET    /queries/:id(.:format)            blazer/queries#show
#                   PATCH  /queries/:id(.:format)            blazer/queries#update
#                   PUT    /queries/:id(.:format)            blazer/queries#update
#                   DELETE /queries/:id(.:format)            blazer/queries#destroy

#            checks GET    /checks(.:format)                 blazer/checks#index
#                   POST   /checks(.:format)                 blazer/checks#create

#        edit_check GET    /checks/:id/edit(.:format)        blazer/checks#edit
#             check PATCH  /checks/:id(.:format)             blazer/checks#update
#                   PUT    /checks/:id(.:format)             blazer/checks#update
#                   DELETE /checks/:id(.:format)             blazer/checks#destroy
# refresh_dashboard POST   /dashboards/:id/refresh(.:format) blazer/dashboards#refresh
#        dashboards POST   /dashboards(.:format)             blazer/dashboards#create


#         dashboard GET    /dashboards/:id(.:format)         blazer/dashboards#show
#                   PATCH  /dashboards/:id(.:format)         blazer/dashboards#update
#                   PUT    /dashboards/:id(.:format)         blazer/dashboards#update
#                   DELETE /dashboards/:id(.:format)         blazer/dashboards#destroy
#              root GET    /                                 blazer/queries#home











# MAIN
URL = "http://localhost:3000"
OUTPUT_DIR = sys.argv[1]

# create directory if it doesn't already exist
pathlib.Path(OUTPUT_DIR).mkdir(parents=True, exist_ok=True)

run_tests()

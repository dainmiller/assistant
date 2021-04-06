import yaml
from datetime import date
from datetime import datetime
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from dateutil import parser

class Plotting:

    def py_time(self, time_string):
        datetime = parser.parse(time_string)
        time     = datetime.time().strftime("%H:%M")
        return time

    def ungrouped_plot_of_daily_activity(self):
        with open('my_database.yaml') as file:
            db = yaml.load(file, Loader=yaml.FullLoader)
            db = dict(db)
            x_timestamp = []
            y_score = []
            for date_of_logs in db['log']:
                for timestamp in db['log'][date_of_logs]:
                    datetime = parser.parse(timestamp)
                    time = datetime.time().strftime("%H:%M")
                    x_timestamp.app***REMOVED***(time)
                    for action in db['log'][date_of_logs][timestamp]:
                        value = db['log'][date_of_logs][timestamp][action]
                        y_score.app***REMOVED***(value)
        plt.figure(figsize=(14,7))
        plt.plot(x_timestamp, y_score, color='Green', marker='d', label='water')
        plt.ylabel("Score from Activity")
        plt.xlabel("Time of Activity")
        plt.title("Activities in Day by Time")
        plt.leg***REMOVED***(loc=1)
        plt.show()

    def grouped_by_activity_daily_log(self):
        with open('my_database.yaml') as file:
            db                  = yaml.load(file, Loader=yaml.FullLoader)
            structure_starts    = db['log']

      ***REMOVED***_labels    = []
      ***REMOVED***_y         = []
            phys_labels     = []
            phys_y          = []
            men_labels      = []
            men_y           = []
            spir_labels     = []
            spir_y          = []
            emo_labels      = []
            emo_y           = []
            intel_labels    = []
            intel_y         = []

            all_dates_with_data = []
            timestamps_in_day   = []

            for _date in structure_starts:
                all_dates_with_data.app***REMOVED***(_date)
                timestamps = structure_starts[_date]
                for time in timestamps:
                    timestamps_in_day.app***REMOVED***(self.py_time(time))
                    actions = timestamps[time]
                    for action in actions:
                        value = actions[action]
                        if action == "water":
                      ***REMOVED***_labels.app***REMOVED***(action)
                      ***REMOVED***_y.app***REMOVED***(value)
                        elif action == "phys":
                            phys_y.app***REMOVED***(value)
                            phys_labels.app***REMOVED***(action)
                        elif action == "men":
                            men_labels.app***REMOVED***(action)
                        elif action == "spir":
                            spir_labels.app***REMOVED***(action)
                        elif action == "emo":
                            emo_labels.app***REMOVED***(action)
                        elif action == "intel":
                            intel_labels.app***REMOVED***(action)


            timestamps_for_phys = timestamps_in_day
            timestamp_for_water = timestamps_in_day
            timestamps_in_day,water_y = zip(*zip(timestamps_in_day, water_y))

            print(water_labels)
            print(water_y)
            print(timestamps_in_day)

            timestamps_for_phys,phys_labels = zip(*zip(timestamps_for_phys, phys_y))
            print(phys_labels)
            print(timestamps_for_phys)

            print(men_labels)
            print(spir_labels)
            print(emo_labels)
            print(intel_labels)

            plt.figure(figsize=(14,7))
            plt.plot(timestamps_in_day, water_y, color="Green", marker='d', label='Water')
            plt.plot(timestamps_for_phys, phys_y, color="Red", marker='d', label='Phys')
            plt.leg***REMOVED***(loc=1)

            plt.show()

            # print(action)
            # print(value)



plotter = Plotting()
plotter.grouped_by_activity_daily_log()

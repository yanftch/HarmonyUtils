/**
 * Author : yanfeng
 * Desc : 日期操作工具类
 */
export class DateUtil {
  // private static readonly format_
  /**
   * 获取当前日期
   * eg: Tue Jun 04 2024 15:26:19 GMT+0800
   */
  static getToday(): Date {
    return new Date()
  }

  /**
   * 获取当前时间戳(单位：ms)
   *
   */
  static getTimestamp(): number {
    return new Date().getTime()
  }

  /**
   * 获取当前月份
   * 月份默认是从0开始，所以最后需要手动+1
   */
  static getMonth(): number {
    return new Date().getMonth() + 1
  }

  /**
   * 获取当前年份
   */
  static getYear(): number {
    return new Date().getFullYear()
  }

  /**
   * 获取当前日期(当前月中的第几天)
   */
  static getDayOfMonth(): number {

    return new Date().getDate()
  }

  /**
   * 获取当前日期(当周中的第几天)
   */
  static getDayOfWeek(): number {
    return new Date().getDay()
  }

  public static readonly DATE_FORMAT: string = "yyyy-MM-dd"

  /**
   * 将时间戳格式化为指定字符串格式,例如格式化为 yyyy-MM-dd 格式
   * 常见格式：
   * yyyy-MM-dd
   * yyyy/MM/dd
   * HH:mm:ss
   * ...
   */
  static formatTimestamp(timestamp: number, format: string): string {
    if (!timestamp) {
      timestamp = new Date().getTime()
    }
    if (!format) {
      format = DateUtil.DATE_FORMAT
    }
    let date: Date = new Date(timestamp)
    const year: string = String(date.getFullYear())
    const month: string = String(date.getMonth() + 1).padStart(2, "0")
    const day: string = String(date.getDate()).padStart(2, '0');
    const hour: string = String(date.getHours());
    const minute: string = String(date.getMinutes());
    const seconds: string = String(date.getSeconds());

    return format
      .replace('yyyy', year)
      .replace('MM', month)
      .replace('dd', day)
      .replace("HH", hour)
      .replace("mm", minute)
      .replace("ss", seconds);
  }

  /**
   * 将Date对象格式化为字符串
   */
  static formatDate(date: Date, format: string): string {
    if (!date) {
      date = new Date()
    }
    if (!format) {
      format = DateUtil.DATE_FORMAT
    }
    const year: string = String(date.getFullYear())
    const month: string = String(date.getMonth() + 1).padStart(2, "0")
    const day: string = String(date.getDate()).padStart(2, '0');
    const hour: string = String(date.getHours());
    const minute: string = String(date.getMinutes());
    const seconds: string = String(date.getSeconds());

    return format
      .replace('yyyy', year)
      .replace('MM', month)
      .replace('dd', day)
      .replace("HH", hour)
      .replace("mm", minute)
      .replace("ss", seconds);
  }

  /**
   * 将字符串格式转换成时间戳
   */
  static changeStr2Timestamp(dateString: string): number {
    if (!dateString) {
      dateString = DateUtil.formatTimestamp(new Date().getTime(), DateUtil.DATE_FORMAT)
    }
    const separators = ['-', ':', '/'];
    let separator = '';
    for (const sep of separators) {
      if (dateString.includes(sep)) {
        separator = sep;
        break;
      }
    }
    if (separator === '') {
      throw new Error('Invalid date format');
    }

    let arr: Array<number> = dateString.split(separator).map<number>(part => {
      return parseInt(part, 10)
    });

    let year = arr[0]
    let month = arr[1]
    let day = arr[2]
    // 创建一个 Date 对象，注意月份是从 0 开始的（即 0 表示一月）
    const date = new Date();
    date.setFullYear(year, month - 1, day);
    const timestamp = date.getTime();
    return timestamp
  }

  /**
   * 将字符串格式转换成Date对象
   */
  static changeStr2Date(dateString: string): Date {
    if (!dateString) {
      dateString = DateUtil.formatTimestamp(new Date().getTime(), DateUtil.DATE_FORMAT)
    }
    const separators = ['-', ':', '/'];
    let separator = '';
    for (const sep of separators) {
      if (dateString.includes(sep)) {
        separator = sep;
        break;
      }
    }
    if (separator === '') {
      throw new Error('Invalid date format');
    }

    let arr: Array<number> = dateString.split(separator).map<number>(part => {
      return parseInt(part, 10)
    });

    let year = arr[0]
    let month = arr[1]
    let day = arr[2]
    // 创建一个 Date 对象，注意月份是从 0 开始的（即 0 表示一月）
    const date = new Date();
    date.setFullYear(year, month - 1, day);
    return date
  }


  /**
   * 仅用于验证效果使用，非正式使用
   */
  // static getFormatDateTest(): string {
  //   return DateUtil.getFormatDate(111, "yyyy-MM-dd")
  // }
}
 
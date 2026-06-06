package util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import entity.Student;

public class ExcelUtil {
    /**
     * 读取Excel文件中的学生信息
     * 直接使用XSSFWorkbook，避开WorkbookFactory的commons-io依赖
     */
    public static List<Student> readStudentExcel(InputStream inputStream) throws Exception {
        List<Student> studentList = new ArrayList<>();
        // 直接创建XSSFWorkbook，不使用WorkbookFactory
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet sheet = workbook.getSheetAt(0); // 读取第一个工作表
        
        // 从第二行开始读取（第一行是表头）
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            if (row == null) continue;
            
            Student student = new Student();
            // 读取单元格数据，自动处理空值
            student.setId((int) getCellValue(row.getCell(0)));
            student.setName(getCellValue(row.getCell(1)).toString());
            student.setSex(getCellValue(row.getCell(2)).toString());
            student.setAge((int) getCellValue(row.getCell(3)));
            student.setGrade(getCellValue(row.getCell(4)).toString());
            student.setScore(Float.parseFloat(getCellValue(row.getCell(5)).toString()));
            
            studentList.add(student);
        }
        
        workbook.close();
        return studentList;
    }
    
    /**
     * 统一处理Excel单元格数据类型
     */
    private static Object getCellValue(Cell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue();
                } else {
                    // 数字类型统一转为double后再处理
                    double numValue = cell.getNumericCellValue();
                    // 如果是整数，返回int
                    if (numValue == Math.floor(numValue) && !Double.isInfinite(numValue)) {
                        return (int) numValue;
                    }
                    return numValue;
                }
            case STRING:
                return cell.getStringCellValue().trim();
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case FORMULA:
                return cell.getCellFormula();
            default:
                return "";
        }
    }
}